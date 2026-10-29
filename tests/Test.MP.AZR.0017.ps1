function Test-MpAzure0017 {
    [MaesterTest(
        Id = 'MP.AZR.0017',
        Title = 'Enable service-managed failover for multi-region Cosmos DB accounts',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '9cabded7-a1fc-6e4a-944b-d7dd98ea31a2'
}
