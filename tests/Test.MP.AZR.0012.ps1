function Test-MpAzure0012 {
    [MaesterTest(
        Id = 'MP.AZR.0012',
        Title = 'Deploy Application Gateway in a zone-redundant configuration',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'c9c00f2a-3888-714b-a72b-b4c9e8fcffb2'
}
