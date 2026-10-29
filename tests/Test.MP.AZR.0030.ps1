function Test-MpAzure0030 {
    [MaesterTest(
        Id = 'MP.AZR.0030',
        Title = 'Upgrade API Management platform version to stv2',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'e35cf148-8eee-49d1-a1c9-956160f99e0b'
}
