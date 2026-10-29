function Test-MpAzure0036 {
    [MaesterTest(
        Id = 'MP.AZR.0036',
        Title = 'Migrate App Service Plan to availability zone support',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '88cb90c2-3b99-814b-9820-821a63f600dd'
}
