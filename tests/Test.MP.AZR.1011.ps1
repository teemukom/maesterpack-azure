function Test-MpAzure1011 {
    [MaesterTest(
        Id = 'MP.AZR.1011',
        Title = 'Ensure Cosmos DB public network access is disabled',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'CosmosDB')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtCosmosDbPublicAccess
}