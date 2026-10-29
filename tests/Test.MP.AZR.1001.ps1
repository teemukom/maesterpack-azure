function Test-MpAzure1001 {
    [MaesterTest(
        Id = 'MP.AZR.1001',
        Title = 'Enforce the latest TLS version for a storage account',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Storage')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtStorageAccountTlsVersion
}