function Test-MpAzure1021 {
    [MaesterTest(
        Id = 'MP.AZR.1021',
        Title = 'Ensure every enabled subscription has at least one budget with alerts configured',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Cost', 'Azure', 'CostOptimization')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtCostBudgetsCoverage
}