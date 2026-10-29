function Test-MpAzure1009 {
    [MaesterTest(
        Id = 'MP.AZR.1009',
        Title = 'Ensure SQL Managed Instance public data endpoint is disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'SQL')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtSqlManagedInstancePublicAccess
}