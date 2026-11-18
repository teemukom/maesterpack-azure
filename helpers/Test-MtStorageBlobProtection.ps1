function Test-MtStorageBlobProtection {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    try {
        $query = @'
Resources
| where type =~ 'Microsoft.Storage/storageAccounts'
| extend accountKind = tostring(kind), isHnsEnabled = tobool(properties.isHnsEnabled)
| where accountKind in~ ('Storage', 'StorageV2', 'BlobStorage', 'BlockBlobStorage')
| project id, name, resourceGroup, subscriptionId, accountKind, isHnsEnabled
'@
        $storageAccounts = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    if ($storageAccounts.Count -eq 0) {
        Add-MtTestResultDetail -Result 'No blob-capable Storage accounts were found.'
        return $true
    }

    $nonCompliantServices = @()
    foreach ($account in $storageAccounts) {
        $accountKind = [string]$account.accountKind
        $isHnsEnabled = $account.isHnsEnabled
        $supportsVersioning = $accountKind -in @('StorageV2', 'BlobStorage', 'BlockBlobStorage')

        if ($supportsVersioning -and $null -eq $isHnsEnabled) {
            $accountRelativeUri = "$($account.id.TrimStart('/'))"
            try {
                $accountProperties = Invoke-MtAzureRequest -RelativeUri $accountRelativeUri -ApiVersion '2023-05-01'
                if ([string]::IsNullOrWhiteSpace($accountKind)) {
                    $accountKind = [string]$accountProperties.kind
                    $supportsVersioning = $accountKind -in @('StorageV2', 'BlobStorage', 'BlockBlobStorage')
                }
                if ($null -eq $accountProperties -or $null -eq $accountProperties.properties) {
                    throw "ARM did not return properties for Storage account '$($account.name)'."
                }
                # The Storage Resource Provider omits isHnsEnabled when it is false by default.
                $isHnsEnabled = $accountProperties.properties.isHnsEnabled -eq $true
            }
            catch {
                Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
                return $null
            }

        }

        $relativeUri = "$($account.id.TrimStart('/'))/blobServices/default"
        try {
            $blobService = Invoke-MtAzureRequest -RelativeUri $relativeUri -ApiVersion '2023-01-01'
        }
        catch {
            Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
            return $null
        }

        if ($null -eq $blobService -or $null -eq $blobService.properties) {
            Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason "The ARM response did not contain blob-service properties for Storage account '$($account.name)'."
            return $null
        }

        $versioningApplies = $supportsVersioning -and $isHnsEnabled -eq $false
        $softDeleteEnabled = $blobService.properties.deleteRetentionPolicy.enabled -eq $true
        $versioningEnabled = $blobService.properties.isVersioningEnabled -eq $true

        if ($softDeleteEnabled -ne $true -or ($versioningApplies -and $versioningEnabled -ne $true)) {
            $nonCompliantServices += [pscustomobject]@{
                Name                = $account.name
                ResourceGroup       = $account.resourceGroup
                SubscriptionId      = $account.subscriptionId
                Kind                = $accountKind
                SoftDeleteEnabled   = $softDeleteEnabled
                VersioningApplies   = $versioningApplies
                VersioningEnabled   = $versioningEnabled
            }
        }
    }

    if ($nonCompliantServices.Count -eq 0) {
        Add-MtTestResultDetail -Result "Well done. All $($storageAccounts.Count) blob-capable Storage accounts have soft delete enabled and versioning enabled where supported."
        return $true
    }

    $details = foreach ($service in $nonCompliantServices) {
        $versioningState = if (-not $service.VersioningApplies) {
            'Not applicable'
        }
        elseif ($service.VersioningEnabled -eq $true) {
            'Enabled'
        }
        else {
            'Disabled'
        }
        "- $($service.Name) (subscription: $($service.SubscriptionId), resource group: $($service.ResourceGroup), kind: $($service.Kind)): blob soft delete $($service.SoftDeleteEnabled); blob versioning $versioningState."
    }
    Add-MtTestResultDetail -Result "Some applicable Storage blob services do not meet the data-protection requirements.`n`n**Storage account details:**`n$($details -join "`n")"
    return $false
}
