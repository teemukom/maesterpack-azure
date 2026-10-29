function Test-MpAzure0028 {
    [MaesterTest(
        Id = 'MP.AZR.0028',
        Title = 'Migrate API Management services to Premium SKU to support Availability Zones',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Reliability', 'Resiliency')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'baf3bfc0-32a2-4c0c-926d-c9bf0b49808e'
}
