function Test-MpAzure1030 {
    [MaesterTest(
        Id = 'MP.AZR.1030',
        Title = 'Disable the admin account for Azure Container Registries',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'ContainerRegistry')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAcrAdminAccount
}
