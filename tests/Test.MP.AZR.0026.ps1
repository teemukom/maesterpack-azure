function Test-MpAzure0026 {
    [MaesterTest(
        Id = 'MP.AZR.0026',
        Title = 'Enable zone redundancy for Azure SQL Database',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'c0085c32-84c0-c247-bfa9-e70977cbf108'
}
