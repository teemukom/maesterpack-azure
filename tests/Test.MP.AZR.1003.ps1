function Test-MpAzure1003 {
    [MaesterTest(
        Id = 'MP.AZR.1003',
        Title = 'Ensure all Storage Accounts have public network access disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Storage')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtStorageAccountPublicAccess
}