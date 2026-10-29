function Test-MpAzure0033 {
    [MaesterTest(
        Id = 'MP.AZR.0033',
        Title = 'Use Private Endpoints instead of Service Endpoints for PaaS services',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Security')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '24ae3773-cc2c-3649-88de-c9788e25b463'
}
