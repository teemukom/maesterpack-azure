function Test-MpAzure0002 {
    [MaesterTest(
        Id = 'MP.AZR.0002',
        Title = 'Deploy Virtual Machines across availability zones',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '2bd0be95-a825-6f47-a8c6-3db1fb5eb387'
}
