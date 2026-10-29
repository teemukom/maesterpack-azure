function Test-MpAzure1010 {
    [MaesterTest(
        Id = 'MP.AZR.1010',
        Title = 'Ensure AKS API server is private',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'AKS')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAksApiServerPublicAccess
}