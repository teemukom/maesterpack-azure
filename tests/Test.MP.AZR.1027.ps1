function Test-MpAzure1027 {
    [MaesterTest(
        Id = 'MP.AZR.1027',
        Title = 'Ensure all subscriptions have activity logs forwarded',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Monitoring', 'Azure', 'Security', 'OperationalExcellence')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtSubscriptionActivityLogs
}