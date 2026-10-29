function Test-MpAzure0035 {
    [MaesterTest(
        Id = 'MP.AZR.0035',
        Title = 'Deploy App Service to a staging slot',
        Product = 'Azure',
        Severity = 'Low',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'a1d91661-32d4-430b-b3b6-5adeb0975df7'
}
