function Test-MpAzure1002 {
    [MaesterTest(
        Id = 'MP.AZR.1002',
        Title = 'Check for Anonymous Public Blob Access',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Storage')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtStorageAccountAnonymousBlobAccess
}