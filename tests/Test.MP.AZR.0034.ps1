function Test-MpAzure0034 {
    [MaesterTest(
        Id = 'MP.AZR.0034',
        Title = 'Enable Virtual Network Flow Logs',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'OperationalExcellence')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '06b77be9-56a3-4d41-b362-8b295c5a283d'
}
