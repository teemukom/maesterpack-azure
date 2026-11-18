function Test-MpAzure0040 {
    [MaesterTest(
        Id = 'MP.AZR.0040',
        Title = 'Disable anonymous pull access for Azure Container Registry',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Security')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '03f4a7d8-c5b4-7842-8e6e-14997a34842b'
}
