function Test-MpAzure0013 {
    [MaesterTest(
        Id = 'MP.AZR.0013',
        Title = 'Choose a zone-redundant VPN gateway SKU',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '5b1933a6-90e4-f642-a01f-e58594e5aab2'
}
