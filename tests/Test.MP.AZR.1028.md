Azure Storage accounts should require secure transfer so clients can connect only over HTTPS. This custom test fails when `supportsHttpsTrafficOnly` is false or cannot be confirmed. It is not APRL-mapped; it evaluates the account configuration and does not assess client behavior.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the Storage account and select **Configuration**.
2. Set **Secure transfer required** to **Enabled** and save.
3. Confirm applications use HTTPS endpoints.

Using Azure CLI:
`az storage account update --name <name> --resource-group <resource-group> --https-only true`

#### Related links

- [Require secure transfer for Azure Storage](https://learn.microsoft.com/en-us/azure/storage/common/storage-require-secure-transfer)

<!--- Results --->

%TestResult%
