function Test-MtKeyVaultAuditEventDiagnostics {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    try {
        $query = "Resources | where type =~ 'Microsoft.KeyVault/vaults' | project id, name, resourceGroup, subscriptionId"
        $vaults = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    $nonCompliantVaults = @()
    foreach ($vault in $vaults) {
        try {
            $diagnosticSettings = Invoke-MtAzureRequest `
                -RelativeUri "$($vault.id)/providers/microsoft.insights/diagnosticSettings" `
                -ApiVersion '2021-05-01-preview'
        }
        catch {
            Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
            return $null
        }

        $hasAuditEventDestination = $false
        foreach ($setting in @($diagnosticSettings.value)) {
            $properties = $setting.properties
            $hasDestination = (
                -not [string]::IsNullOrWhiteSpace([string]$properties.workspaceId) -or
                -not [string]::IsNullOrWhiteSpace([string]$properties.storageAccountId) -or
                -not [string]::IsNullOrWhiteSpace([string]$properties.eventHubAuthorizationRuleId)
            )
            $hasEnabledAuditEvent = @($properties.logs | Where-Object { $_.category -eq 'AuditEvent' -and $_.enabled -eq $true }).Count -gt 0
            if ($hasDestination -and $hasEnabledAuditEvent) {
                $hasAuditEventDestination = $true
                break
            }
        }

        if (-not $hasAuditEventDestination) {
            $nonCompliantVaults += $vault
        }
    }

    if ($nonCompliantVaults.Count -eq 0) {
        $message = if ($vaults.Count -eq 0) {
            'No Key Vaults found.'
        }
        else {
            "Well done. All $($vaults.Count) Key Vaults route enabled AuditEvent logging to a configured destination."
        }
        Add-MtTestResultDetail -Result $message
        return $true
    }

    $details = foreach ($vault in $nonCompliantVaults) {
        "- $($vault.name) (subscription: $($vault.subscriptionId), resource group: $($vault.resourceGroup)) has no diagnostic setting with enabled AuditEvent logging and a configured Log Analytics workspace, Storage account, or Event Hub."
    }
    Add-MtTestResultDetail -Result "Some Key Vaults do not route AuditEvent diagnostic logs to a configured destination.`n`n**Key Vault details:**`n$($details -join "`n")"
    return $false
}
