Storage Accounts should enforce a minimum TLS version of 1.2 to protect data in transit from attacks targeting legacy TLS vulnerabilities. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the Storage Account.
2. Select **Configuration** in the left menu.
3. Under **Minimum TLS version**, select **Version 1.2**.
4. Click **Save**.

Using Azure CLI:
`az storage account update --name <name> --resource-group <rg> --min-tls-version TLS1_2`

#### Related links

- [Configure minimum required TLS version for a storage account](https://learn.microsoft.com/en-us/azure/storage/common/transport-layer-security-configure-minimum-version)

<!--- Results --->

%TestResult%
