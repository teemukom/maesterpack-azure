function Test-MpAzure1008 {
    [MaesterTest(
        Id = 'MP.AZR.1008',
        Title = 'Ensure PostgreSQL Server public network access is disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'PostgreSQL')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtPostgreSqlServerPublicAccess
}