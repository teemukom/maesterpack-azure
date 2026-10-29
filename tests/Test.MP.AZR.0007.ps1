function Test-MpAzure0007 {
    [MaesterTest(
        Id = 'MP.AZR.0007',
        Title = 'Ensure storage accounts are zone or region redundant',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'e6c7e1cc-2f47-264d-aa50-1da421314472'
}
