function Test-MpAzure0029 {
    [MaesterTest(
        Id = 'MP.AZR.0029',
        Title = 'Enable Availability Zones on Premium API Management instances',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '740f2c1c-8857-4648-80eb-47d2c56d5a50'
}
