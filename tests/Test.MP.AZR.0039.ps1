function Test-MpAzure0039 {
    [MaesterTest(
        Id = 'MP.AZR.0039',
        Title = 'Enable zone redundancy for Azure Container Registry',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '63491f70-22e4-3b4a-8b0c-845450e46fac'
}
