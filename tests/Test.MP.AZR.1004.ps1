function Test-MpAzure1004 {
    [MaesterTest(
        Id = 'MP.AZR.1004',
        Title = 'Ensure all Key vaults have public network access disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'KeyVault')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtKeyVaultPublicAccess
}