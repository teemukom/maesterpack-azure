function Test-MpAzure0001 {
    [MaesterTest(
        Id = 'MP.AZR.0001',
        Title = 'Deploy Azure Firewall across multiple availability zones',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'c72b7fee-1fa0-5b4b-98e5-54bcae95bb74'
}
