Applicable Azure Storage blob services should enable blob soft delete and, where supported, blob versioning to help recover from accidental deletion or modification. This custom test checks service configuration. Versioning is not evaluated for hierarchical-namespace accounts or account types where Azure does not support it.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the Storage account and select **Data protection**.
2. Enable **Enable soft delete for blobs** and choose a retention period that meets your recovery requirements.
3. For a supported non-hierarchical-namespace account, also enable **Enable versioning for blobs**.
4. Confirm the selected account type supports the settings before changing its configuration.

Using Azure CLI:
`az storage account blob-service-properties update --account-name <name> --resource-group <resource-group> --enable-delete-retention true --delete-retention-days 7 --enable-versioning true`

#### Related links

- [Enable soft delete for blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/soft-delete-blob-enable)
- [Blob versioning overview and supported account types](https://learn.microsoft.com/en-us/azure/storage/blobs/versioning-overview)

<!--- Results --->

%TestResult%
