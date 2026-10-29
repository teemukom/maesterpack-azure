function Test-MpAzure0022 {
    [MaesterTest(
        Id = 'MP.AZR.0022',
        Title = 'Use Health Probes to detect Application Gateway backend availability',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid '847a8d88-21c4-bc48-a94e-562206edd767'
}
