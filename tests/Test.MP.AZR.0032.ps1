function Test-MpAzure0032 {
    [MaesterTest(
        Id = 'MP.AZR.0032',
        Title = 'Enable DDoS Protection for Virtual Networks',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '69ea1185-19b7-de40-9da1-9e8493547a5c'
}
