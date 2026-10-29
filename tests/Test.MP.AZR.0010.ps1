function Test-MpAzure0010 {
    [MaesterTest(
        Id = 'MP.AZR.0010',
        Title = 'Key vaults should have soft delete enabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '1cca00d2-d9ab-8e42-a788-5d40f49405cb'
}
