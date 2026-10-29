function Test-MpAzure1020 {
    [MaesterTest(
        Id = 'MP.AZR.1020',
        Title = 'Ensure at least one Cost Management budget has alerts configured',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Cost', 'Azure', 'CostOptimization')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtCostBudgets
}