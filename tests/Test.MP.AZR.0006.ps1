function Test-MpAzure0006 {
    [MaesterTest(
        Id = 'MP.AZR.0006',
        Title = 'Ensure Application Gateway autoscale is enabled with minimum capacity >= 2',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '823b0cff-05c0-2e4e-a1e7-9965e1cfa16f'
}
