function Test-MpAzure0003 {
    [MaesterTest(
        Id = 'MP.AZR.0003',
        Title = 'Ensure Standard Load Balancer is zone-redundant',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '621dbc78-3745-4d32-8eac-9e65b27b7512'
}
