function Test-MpAzure0038 {
    [MaesterTest(
        Id = 'MP.AZR.0038',
        Title = 'Set minimum instance count to 2 for App Service Plans',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Scalability')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '855ca19a-6518-4f2e-9e5a-01796fbca9f8'
}
