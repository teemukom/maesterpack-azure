function Test-MtAksLocalAccountsDisabled {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    try {
        $query = "Resources | where type =~ 'Microsoft.ContainerService/managedClusters' | project name, resourceGroup, subscriptionId, disableLocalAccounts = properties.disableLocalAccounts"
        $clusters = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    $nonCompliantClusters = @($clusters | Where-Object { $_.disableLocalAccounts -ne $true })
    if ($nonCompliantClusters.Count -eq 0) {
        $message = if ($clusters.Count -eq 0) {
            'No AKS clusters found.'
        }
        else {
            "Well done. All $($clusters.Count) AKS clusters have local accounts disabled."
        }
        Add-MtTestResultDetail -Result $message
        return $true
    }

    $details = foreach ($cluster in $nonCompliantClusters) {
        $state = if ($cluster.disableLocalAccounts -eq $false) { 'Enabled' } else { 'Unknown' }
        "- $($cluster.name) (subscription: $($cluster.subscriptionId), resource group: $($cluster.resourceGroup)) has local accounts $state."
    }
    Add-MtTestResultDetail -Result "Some AKS clusters do not have local accounts disabled.`n`nThis is a custom test related to, but not mapped to, APRL guidance. The related upstream APRL recommendation is currently Disabled. Its query filters on Kubernetes RBAC (properties.enableRBAC) and only projects disableLocalAccounts; it does not evaluate whether local accounts are disabled.`n`n**Cluster details:**`n$($details -join "`n")"
    return $false
}
