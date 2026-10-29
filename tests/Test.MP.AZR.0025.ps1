function Test-MpAzure0025 {
    [MaesterTest(
        Id = 'MP.AZR.0025',
        Title = 'Configure Auto Failover Groups for Azure SQL databases',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '943c168a-2ec2-a94c-8015-85732a1b4859'
}
