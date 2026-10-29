function Test-MpAzure0018 {
    [MaesterTest(
        Id = 'MP.AZR.0018',
        Title = 'Deploy AKS cluster node pools across availability zones',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '4f63619f-5001-439c-bacb-8de891287727'
}
