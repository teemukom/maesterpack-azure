function Test-MtAppServiceHttpsAndTls {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    try {
        $query = "Resources | where type =~ 'Microsoft.Web/sites' | project name, resourceGroup, subscriptionId, httpsOnly = properties.httpsOnly, minimumTlsVersion = properties.siteConfig.minTlsVersion"
        $apps = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    $nonCompliantApps = @()
    foreach ($app in $apps) {
        $tlsVersion = [string]$app.minimumTlsVersion
        $tlsIsCompliant = $false
        if ($tlsVersion -match '^\d+(\.\d+){1,2}$') {
            $tlsIsCompliant = [version]$tlsVersion -ge [version]'1.2'
        }

        if ($app.httpsOnly -ne $true -or -not $tlsIsCompliant) {
            $nonCompliantApps += [pscustomobject]@{
                Name            = $app.name
                ResourceGroup   = $app.resourceGroup
                SubscriptionId  = $app.subscriptionId
                HttpsOnly       = $app.httpsOnly
                MinimumTls      = if ($tlsVersion) { $tlsVersion } else { 'Unknown' }
            }
        }
    }

    if ($nonCompliantApps.Count -eq 0) {
        $message = if ($apps.Count -eq 0) {
            'No production App Service apps found.'
        }
        else {
            "Well done. All $($apps.Count) production App Service apps require HTTPS and TLS 1.2 or later."
        }
        Add-MtTestResultDetail -Result $message
        return $true
    }

    $details = foreach ($app in $nonCompliantApps) {
        $httpsState = if ($app.HttpsOnly -eq $true) { 'Enabled' } elseif ($app.HttpsOnly -eq $false) { 'Disabled' } else { 'Unknown' }
        "- $($app.Name) (subscription: $($app.SubscriptionId), resource group: $($app.ResourceGroup)): HTTPS-only $httpsState; minimum inbound TLS $($app.MinimumTls)."
    }
    Add-MtTestResultDetail -Result "Some production App Service apps do not require HTTPS and TLS 1.2 or later.`n`n**App details:**`n$($details -join "`n")"
    return $false
}
