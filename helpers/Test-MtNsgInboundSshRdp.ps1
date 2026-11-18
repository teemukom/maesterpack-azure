function Test-MtNsgInboundSshRdp {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    try {
        $query = "Resources | where type =~ 'Microsoft.Network/networkSecurityGroups' | project name, resourceGroup, subscriptionId, securityRules = properties.securityRules"
        $networkSecurityGroups = @(Invoke-MtAzureResourceGraphRequest -Query $query)
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }

    $broadSources = @('internet', '*', 'any', '0.0.0.0/0', '::/0')
    $findings = @()
    foreach ($nsg in $networkSecurityGroups) {
        foreach ($rule in @($nsg.securityRules)) {
            $properties = $rule.properties
            if ($properties.direction -ne 'Inbound' -or $properties.access -ne 'Allow') {
                continue
            }

            $protocol = [string]$properties.protocol
            if ($protocol -notin @('Tcp', '*')) {
                continue
            }

            $sourcePrefixes = @()
            if ($null -ne $properties.sourceAddressPrefix) {
                $sourcePrefixes += [string]$properties.sourceAddressPrefix
            }
            foreach ($sourcePrefix in @($properties.sourceAddressPrefixes)) {
                if ($null -ne $sourcePrefix) {
                    $sourcePrefixes += [string]$sourcePrefix
                }
            }
            $matchedSources = @($sourcePrefixes | Where-Object { $_.Trim().ToLowerInvariant() -in $broadSources })
            if ($matchedSources.Count -eq 0) {
                continue
            }

            $destinationPorts = @()
            if ($null -ne $properties.destinationPortRange) {
                $destinationPorts += [string]$properties.destinationPortRange
            }
            foreach ($destinationPort in @($properties.destinationPortRanges)) {
                if ($null -ne $destinationPort) {
                    $destinationPorts += [string]$destinationPort
                }
            }

            $matchedPorts = @()
            foreach ($destinationPort in $destinationPorts) {
                foreach ($portToken in ($destinationPort -split ',')) {
                    $portToken = $portToken.Trim()
                    if ($portToken -eq '*') {
                        $matchedPorts += '22', '3389'
                    }
                    elseif ($portToken -match '^\d+$') {
                        if ([int]$portToken -in @(22, 3389)) {
                            $matchedPorts += $portToken
                        }
                    }
                    elseif ($portToken -match '^(\d+)\s*-\s*(\d+)$') {
                        $rangeStart = [int]$Matches[1]
                        $rangeEnd = [int]$Matches[2]
                        foreach ($targetPort in @(22, 3389)) {
                            if ($targetPort -ge $rangeStart -and $targetPort -le $rangeEnd) {
                                $matchedPorts += [string]$targetPort
                            }
                        }
                    }
                }
            }

            $matchedPorts = @($matchedPorts | Sort-Object -Unique)
            if ($matchedPorts.Count -gt 0) {
                $findings += [pscustomobject]@{
                    Nsg              = $nsg.name
                    ResourceGroup    = $nsg.resourceGroup
                    SubscriptionId   = $nsg.subscriptionId
                    RuleName         = $rule.name
                    Priority         = $properties.priority
                    Protocol         = $protocol
                    Sources          = ($matchedSources | Sort-Object -Unique) -join ', '
                    DestinationPorts = ($destinationPorts | Sort-Object -Unique) -join ', '
                    MatchedPorts     = ($matchedPorts -join ', ')
                }
            }
        }
    }

    if ($findings.Count -eq 0) {
        Add-MtTestResultDetail -Result 'No inbound allow rules were found with Internet/Any sources and SSH or RDP destination ports.'
        return $true
    }

    $details = foreach ($finding in $findings) {
        "- NSG $($finding.Nsg) (subscription: $($finding.SubscriptionId), resource group: $($finding.ResourceGroup)), rule $($finding.RuleName) (priority $($finding.Priority)) allows protocol $($finding.Protocol), source $($finding.Sources), destination $($finding.DestinationPorts); matched port(s): $($finding.MatchedPorts)."
    }
    Add-MtTestResultDetail -Result "Found $($findings.Count) inbound NSG rule(s) configured to allow Internet/Any sources to SSH or RDP ports. These findings describe rule configuration only; they do not establish effective reachability.`n`n**Rule details:**`n$($details -join "`n")"
    return $false
}
