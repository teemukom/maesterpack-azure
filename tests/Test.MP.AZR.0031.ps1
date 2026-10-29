function Test-MpAzure0031 {
    [MaesterTest(
        Id = 'MP.AZR.0031',
        Title = 'Ensure eligible subnets have a Network Security Group associated',
        Product = 'Azure',
        Severity = 'Low',
        Service = 'Azure',
        Tag = ('Azure', 'APRL', 'Security')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtAprlRecommendation -AprlGuid 'f0bf9ae6-25a5-974d-87d5-025abec73539'
}
