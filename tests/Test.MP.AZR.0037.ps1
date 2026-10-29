function Test-MpAzure0037 {
    [MaesterTest(
        Id = 'MP.AZR.0037',
        Title = 'Use Standard or Premium tier for App Service Plans',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'b2113023-a553-2e41-9789-597e2fb54c31'
}
