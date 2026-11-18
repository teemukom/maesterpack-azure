function Test-MpAzure1029 {
    [MaesterTest(
        Id = 'MP.AZR.1029',
        Title = 'Require HTTPS and TLS 1.2 for production App Service apps',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'AppService')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAppServiceHttpsAndTls
}
