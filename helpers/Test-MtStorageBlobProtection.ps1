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
| where type =~ 'Microsoft.Storage/storageAccounts/blobServices'
| where tolower(id) endswith '/blobservices/default'
| extend accountId = tolower(substring(id, 0, indexof(tolower(id), '/blobservices/')))
| project serviceId = id, accountId, resourceGroup, subscriptionId,
    softDeleteEnabled = tobool(properties.deleteRetentionPolicy.enabled),
    versioningEnabled = tobool(properties.isVersioningEnabled)
| join kind=inner (
    Resources
    | where type =~ 'Microsoft.Storage/storageAccounts'
    | project accountId = tolower(id), accountName = name, accountKind = tostring(kind),
        isHnsEnabled = tobool(properties.isHnsEnabled)
) on accountId
| project serviceId, accountName, resourceGroup, subscriptionId, accountKind, isHnsEnabled,
    softDeleteEnabled, versioningEnabled
'@
        $blobServices = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    if ($blobServices.Count -eq 0) {
        Add-MtTestResultDetail -Result 'No applicable Storage blob services were found.'
        return $true
    }

    $nonCompliantServices = @()
    foreach ($service in $blobServices) {
        if ($null -eq $service.softDeleteEnabled) {
            Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason "Could not determine blob soft-delete support or state for Storage account '$($service.accountName)'."
            return $null
        }

        $supportsVersioning = $service.accountKind -in @('StorageV2', 'BlobStorage', 'BlockBlobStorage')
        if ($supportsVersioning -and $null -eq $service.isHnsEnabled) {
            Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason "Could not determine whether hierarchical namespace is enabled for Storage account '$($service.accountName)', so blob versioning applicability could not be established."
            return $null
        }
        $versioningApplies = $supportsVersioning -and $service.isHnsEnabled -eq $false
        if ($versioningApplies -and $null -eq $service.versioningEnabled) {
            Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason "Could not determine blob versioning support or state for Storage account '$($service.accountName)'."
            return $null
        }

        if ($service.softDeleteEnabled -ne $true -or ($versioningApplies -and $service.versioningEnabled -ne $true)) {
            $nonCompliantServices += [pscustomobject]@{
                Name                = $service.accountName
                ResourceGroup       = $service.resourceGroup
                SubscriptionId      = $service.subscriptionId
                Kind                = $service.accountKind
                SoftDeleteEnabled   = $service.softDeleteEnabled
                VersioningApplies   = $versioningApplies
                VersioningEnabled   = $service.versioningEnabled
            }
        }
    }

    if ($nonCompliantServices.Count -eq 0) {
        Add-MtTestResultDetail -Result "Well done. All $($blobServices.Count) applicable Storage blob services have soft delete enabled and have versioning enabled where supported."
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
