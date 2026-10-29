function Test-MpAzure1007 {
    [MaesterTest(
        Id = 'MP.AZR.1007',
        Title = 'Ensure MySQL Server public network access is disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'MySQL')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtMySqlServerPublicAccess
}