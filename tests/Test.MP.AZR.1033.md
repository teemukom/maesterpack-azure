Key Vault diagnostic settings should enable the `AuditEvent` log and send it to at least one configured Log Analytics workspace, Storage account, or Event Hub. This custom test accepts any one of these destinations and is not APRL-mapped.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the Key Vault and select **Diagnostic settings**.
2. Create or edit a setting, enable **AuditEvent**, and select at least one supported destination.
3. Save the setting and verify that logs arrive at the selected destination.

#### Related links

- [Monitor Key Vault with Azure Monitor](https://learn.microsoft.com/en-us/azure/key-vault/general/howto-logging)

<!--- Results --->

%TestResult%
