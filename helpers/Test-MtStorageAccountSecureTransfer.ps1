function Test-MtStorageAccountSecureTransfer {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    try {
        $query = "Resources | where type =~ 'Microsoft.Storage/storageAccounts' | project name, resourceGroup, subscriptionId, supportsHttpsTrafficOnly = properties.supportsHttpsTrafficOnly"
        $accounts = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    $nonCompliantAccounts = @($accounts | Where-Object { $_.supportsHttpsTrafficOnly -ne $true })
    if ($nonCompliantAccounts.Count -eq 0) {
        $message = if ($accounts.Count -eq 0) {
            'No Storage accounts found.'
        }
        else {
            "Well done. All $($accounts.Count) Storage accounts require secure transfer."
        }
        Add-MtTestResultDetail -Result $message
        return $true
    }

    $details = foreach ($account in $nonCompliantAccounts) {
        $state = if ($null -eq $account.supportsHttpsTrafficOnly) { 'Unknown' } else { 'Disabled' }
        "- $($account.name) (subscription: $($account.subscriptionId), resource group: $($account.resourceGroup)) has secure transfer set to $state."
    }
    Add-MtTestResultDetail -Result "Some Storage accounts do not require secure transfer.`n`n**Storage account details:**`n$($details -join "`n")"
    return $false
}
