function Test-MpAzure1012 {
    [MaesterTest(
        Id = 'MP.AZR.1012',
        Title = 'Ensure Event Hub public network access is disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'EventHubs')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtEventHubPublicAccess
}