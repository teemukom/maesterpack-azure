function Test-MpAzure1033 {
    [MaesterTest(
        Id = 'MP.AZR.1033',
        Title = 'Send Key Vault AuditEvent logs to a diagnostic destination',
        Product = 'Azure',
        Severity = 'High',
        Service = 'Azure',
        Tag = ('Azure', 'Security', 'Monitoring')
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    return Test-MtKeyVaultAuditEventDiagnostics
}
