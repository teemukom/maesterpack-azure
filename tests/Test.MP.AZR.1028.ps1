function Test-MpAzure1028 {
    [MaesterTest(
        Id = 'MP.AZR.1028',
        Title = 'Require secure transfer for Azure Storage accounts',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Storage')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtStorageAccountSecureTransfer
}
