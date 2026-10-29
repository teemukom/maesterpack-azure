function Test-MpAzure1023 {
    [MaesterTest(
        Id = 'MP.AZR.1023',
        Title = 'Identify orphaned Azure resources',
        Product = 'Azure',
        Severity = 'Medium',
        Service = 'Azure',
        Tag = ('Cost', 'Azure', 'CostOptimization')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtOrphanedResources
}