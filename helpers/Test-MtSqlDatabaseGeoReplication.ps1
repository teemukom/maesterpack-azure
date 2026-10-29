function Test-MtSqlDatabaseGeoReplication {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    $query = @"
Resources
| where type =~ 'Microsoft.Sql/servers/databases'
| where name !~ 'master'
| project id, name, resourceGroup, subscriptionId, location, secondaryType = tostring(properties.secondaryType)
"@

    try {
        $databases = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    if ($databases.Count -eq 0) {
        Add-MtTestResultDetail -Result "No Azure SQL user databases found."
        return $true
    }

    $databasesWithoutGeoReplication = @()

    foreach ($database in $databases) {
        if (-not [string]::IsNullOrWhiteSpace($database.secondaryType)) {
            continue
        }

        $resourcePath = @($database.id.Trim('/').Split('/'))
        $serverSegment = [array]::IndexOf($resourcePath, 'servers')
        if ($serverSegment -lt 0 -or $serverSegment + 1 -ge $resourcePath.Count) {
            Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason "Could not determine the SQL server for database '$($database.name)'."
            return $null
        }

        $serverName = $resourcePath[$serverSegment + 1]
        $relativeUri = "subscriptions/$($database.subscriptionId)/resourceGroups/$($database.resourceGroup)/providers/Microsoft.Sql/servers/$serverName/databases/$($database.name)/replicationLinks"

        try {
            $replicationLinks = Invoke-MtAzureRequest -RelativeUri $relativeUri -ApiVersion '2021-11-01'
        }
        catch {
            Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
            return $null
        }

        $hasHealthyGeoReplica = @($replicationLinks.value | Where-Object {
            $link = $_.properties
            $partnerLocation = ([string]$link.partnerLocation) -replace '\s', ''
            $databaseLocation = ([string]$database.location) -replace '\s', ''

            $link.linkType -eq 'GEO' -and
                $link.role -eq 'Primary' -and
                $link.partnerRole -eq 'Secondary' -and
                $link.replicationState -in @('CATCH_UP', 'CATCHUP') -and
                -not [string]::IsNullOrWhiteSpace($partnerLocation) -and
                $partnerLocation -ne $databaseLocation
        }).Count -gt 0

        if (-not $hasHealthyGeoReplica) {
            $databasesWithoutGeoReplication += [pscustomobject]@{
                Name           = $database.name
                Server         = $serverName
                ResourceGroup  = $database.resourceGroup
                SubscriptionId = $database.subscriptionId
            }
        }
    }

    $testResult = $databasesWithoutGeoReplication.Count -eq 0
    if ($testResult) {
        $testResultMarkdown = "Well done. All primary Azure SQL databases have a caught-up GEO replication link to a secondary in another region."
    }
    else {
        $testResultMarkdown = "Found $($databasesWithoutGeoReplication.Count) primary Azure SQL database(s) without a caught-up GEO replication link to another region.`n`n"
        $testResultMarkdown += "| Database | Server | Resource group | Subscription |`n|---|---|---|---|`n"
        foreach ($database in $databasesWithoutGeoReplication) {
            $testResultMarkdown += "| $($database.Name) | $($database.Server) | $($database.ResourceGroup) | $($database.SubscriptionId) |`n"
        }
    }

    $testResultMarkdown += "`n> **APRL recommendation:** [Active Geo Replication (pinned revision)](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/771b1888b1b49ea6b1a2fe15a4d5b55ae46b7d82/azure-resources/Sql/servers/recommendations.yaml) | [Upstream KQL](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/771b1888b1b49ea6b1a2fe15a4d5b55ae46b7d82/azure-resources/Sql/servers/kql/74c2491d-048b-0041-a140-935960220e20.kql)"
    Add-MtTestResultDetail -Result $testResultMarkdown
    return $testResult
}