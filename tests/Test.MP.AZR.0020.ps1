function Test-MpAzure0020 {
    [MaesterTest(
        Id = 'MP.AZR.0020',
        Title = 'Use Standard Load Balancer SKU',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '38c3bca1-97a1-eb42-8cd3-838b243f35ba'
}
