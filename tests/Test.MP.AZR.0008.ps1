function Test-MpAzure0008 {
    [MaesterTest(
        Id = 'MP.AZR.0008',
        Title = 'Enable zone redundancy for Azure Cache for Redis',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '5a44bd30-ae6a-4b81-9b68-dc3a8ffca4d8'
}
