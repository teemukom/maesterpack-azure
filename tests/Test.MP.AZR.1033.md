Key Vault diagnostic settings should enable the `AuditEvent` log and send it to at least one configured Log Analytics workspace, Storage account, or Event Hub. This custom test accepts any one of these destinations and is not APRL-mapped. APRL has related active guidance, but it is marked `automationAvailable: false`; its query is explicitly marked as not validatable with Azure Resource Graph.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the Key Vault and select **Diagnostic settings**.
2. Create or edit a setting, enable **AuditEvent**, and select at least one supported destination.
3. Save the setting and verify that logs arrive at the selected destination.

#### Related links

- [Monitor Key Vault with Azure Monitor](https://learn.microsoft.com/en-us/azure/key-vault/general/howto-logging)
- [Related APRL recommendation metadata at the pinned commit](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/247a48e3059d488d6f49e43b1fed2a85ad1c403b/azure-resources/KeyVault/vaults/recommendations.yaml)
- [Related APRL query at the pinned commit](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/247a48e3059d488d6f49e43b1fed2a85ad1c403b/azure-resources/KeyVault/vaults/kql/1dc0821d-4f14-7644-bab4-ba208ff5f7fa.kql)

<!--- Results --->

%TestResult%
