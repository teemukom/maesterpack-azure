function Test-MpAzure0027 {
    [MaesterTest(
        Id = 'MP.AZR.0027',
        Title = 'Configure Service Bus minimum TLS version to 1.2 or higher',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Security')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'f075a1bd-de9e-4819-9a1d-1ac41037a74f'
}
