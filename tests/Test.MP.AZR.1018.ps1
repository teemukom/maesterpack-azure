function Test-MpAzure1018 {
    [MaesterTest(
        Id = 'MP.AZR.1018',
        Title = 'Ensure Azure Bastion is deployed across availability zones',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtBastionAvailabilityZones
}