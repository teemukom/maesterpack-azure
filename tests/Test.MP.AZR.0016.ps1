function Test-MpAzure0016 {
    [MaesterTest(
        Id = 'MP.AZR.0016',
        Title = 'Configure Cosmos DB accounts with at least two regions',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '43663217-a1d3-844b-80ea-571a2ce37c6c'
}
