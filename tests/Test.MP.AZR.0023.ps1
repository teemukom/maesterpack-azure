function Test-MpAzure0023 {
    [MaesterTest(
        Id = 'MP.AZR.0023',
        Title = 'Upgrade Basic SKU Public IP addresses to Standard SKU',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '5cea1501-6fe4-4ec4-ac8f-f72320eb18d3'
}
