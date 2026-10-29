function Test-MpAzure0009 {
    [MaesterTest(
        Id = 'MP.AZR.0009',
        Title = 'Ensure Event Hub namespace zone redundancy is enabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '84636c6c-b317-4722-b603-7b1ffc16384b'
}
