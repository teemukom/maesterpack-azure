function Test-MpAzure0004 {
    [MaesterTest(
        Id = 'MP.AZR.0004',
        Title = 'Ensure Load Balancer backend pool contains at least two instances',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '6d82d042-6d61-ad49-86f0-6a5455398081'
}
