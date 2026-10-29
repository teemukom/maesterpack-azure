function Test-MpAzure0024 {
    [MaesterTest(
        Id = 'MP.AZR.0024',
        Title = 'Use Active Geo Replication for Azure SQL databases',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '74c2491d-048b-0041-a140-935960220e20'
}
