function Test-MpAzure1024 {
    [MaesterTest(
        Id = 'MP.AZR.1024',
        Title = 'Ensure management group hierarchy depth does not exceed four levels',
        Product = 'Azure',
        Severity = 'Low',
        Service = 'Azure',
        Tag = ('Azure', 'Governance', 'OperationalExcellence')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtManagementGroupHierarchyDepth
}