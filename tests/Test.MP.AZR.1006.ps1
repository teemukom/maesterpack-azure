function Test-MpAzure1006 {
    [MaesterTest(
        Id = 'MP.AZR.1006',
        Title = 'Ensure SQL Server public network access is disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'SQL')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtSqlServerPublicAccess
}