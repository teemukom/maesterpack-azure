Applicable Azure Storage blob services should enable blob soft delete and, where supported, blob versioning to help recover from accidental deletion or modification. This custom test checks service configuration. Versioning is not evaluated for hierarchical-namespace accounts or account types where Azure does not support it. The check is not an APRL mapping: APRL has related active recommendations for soft delete and versioning, both marked `automationAvailable: false`, and their query files are marked `under-development`.

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
- [Related APRL recommendation metadata at the pinned commit](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/247a48e3059d488d6f49e43b1fed2a85ad1c403b/azure-resources/Storage/storageAccounts/recommendations.yaml)
- [APRL soft-delete query](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/247a48e3059d488d6f49e43b1fed2a85ad1c403b/azure-resources/Storage/storageAccounts/kql/03263c57-c869-3841-9e0a-3dbb9ef3e28d.kql)
- [APRL versioning query](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/247a48e3059d488d6f49e43b1fed2a85ad1c403b/azure-resources/Storage/storageAccounts/kql/8ebda7c0-e0e1-ed45-af59-2d7ea9a1c05d.kql)

<!--- Results --->

%TestResult%
