function Test-MpAzure0019 {
    [MaesterTest(
        Id = 'MP.AZR.0019',
        Title = 'Enable Active-Active mode for VPN Gateways',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '281a2713-c0e0-3c48-b596-19f590c46671'
}
