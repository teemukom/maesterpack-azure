function Test-MtAcrAdminAccount {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    try {
        $query = "Resources | where type =~ 'Microsoft.ContainerRegistry/registries' | project name, resourceGroup, subscriptionId, adminUserEnabled = properties.adminUserEnabled"
        $registries = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    $nonCompliantRegistries = @($registries | Where-Object { $_.adminUserEnabled -ne $false })
    if ($nonCompliantRegistries.Count -eq 0) {
        $message = if ($registries.Count -eq 0) {
            'No Azure Container Registries found.'
        }
        else {
            "Well done. All $($registries.Count) Azure Container Registries have the admin account disabled."
        }
        Add-MtTestResultDetail -Result $message
        return $true
    }

    $details = foreach ($registry in $nonCompliantRegistries) {
        $state = if ($registry.adminUserEnabled -eq $true) { 'Enabled' } else { 'Unknown' }
        "- $($registry.name) (subscription: $($registry.subscriptionId), resource group: $($registry.resourceGroup)) has the admin account $state."
    }
    Add-MtTestResultDetail -Result "Some Azure Container Registries do not have the admin account disabled.`n`n**Registry details:**`n$($details -join "`n")"
    return $false
}
