function Test-MpAzure0021 {
    [MaesterTest(
        Id = 'MP.AZR.0021',
        Title = 'Migrate to Application Gateway v2',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '7893f0b3-8622-1d47-beed-4b50a19f7895'
}
