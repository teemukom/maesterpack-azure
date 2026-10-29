function Test-MpAzure1005 {
    [MaesterTest(
        Id = 'MP.AZR.1005',
        Title = 'Ensure WAF Policy is in Prevention Mode',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Network')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtWafPolicyPreventionMode
}