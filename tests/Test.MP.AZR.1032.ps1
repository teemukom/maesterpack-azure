function Test-MpAzure1032 {
    [MaesterTest(
        Id = 'MP.AZR.1032',
        Title = 'Disable local accounts for Azure Kubernetes Service clusters',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'AKS')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAksLocalAccountsDisabled
}
