function Test-MpAzure1034 {
    [MaesterTest(
        Id = 'MP.AZR.1034',
        Title = 'Enable blob soft delete and supported versioning for Storage accounts',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Storage')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtStorageBlobProtection
}
