function Test-MpAzure0011 {
    [MaesterTest(
        Id = 'MP.AZR.0011',
        Title = 'Key vaults should have purge protection enabled',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '70fcfe6d-00e9-5544-a63a-fff42b9f2edb'
}
