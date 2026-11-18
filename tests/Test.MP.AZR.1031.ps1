function Test-MpAzure1031 {
    [MaesterTest(
        Id = 'MP.AZR.1031',
        Title = 'Review NSG inbound allow rules for SSH and RDP from Internet or Any',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Networking')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtNsgInboundSshRdp
}
