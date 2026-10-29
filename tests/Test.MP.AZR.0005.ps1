function Test-MpAzure0005 {
    [MaesterTest(
        Id = 'MP.AZR.0005',
        Title = 'Use Standard SKU and zone-redundant Public IP addresses',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'c63b81fb-7afc-894c-a840-91bb8a8dcfaf'
}
