function Test-MpAzure0015 {
    [MaesterTest(
        Id = 'MP.AZR.0015',
        Title = 'Enable Soft Delete for Recovery Services Vaults',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '9e39919b-78af-4a0b-b70f-c548dae97c25'
}
