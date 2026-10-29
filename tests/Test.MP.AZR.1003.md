This check enforces a strict private-only baseline for Storage Accounts: any enabled public network access, including selected-network access, fails. Well-Architected guidance permits restricting public access when private-only access doesn't fit the workload, so confirm that this baseline is appropriate before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the Storage Account.
2. Select **Networking** in the left menu.
3. Under **Public network access**, select **Disabled**.
4. Add a private endpoint under **Private endpoint connections** and link it to the appropriate virtual network and subnet.
5. Click **Save** and verify that applications, services, and backup jobs can still access the storage account via the private endpoint.

Using Azure CLI:
`az storage account update --name <account> --resource-group <rg> --public-network-access Disabled`

#### Related links

- [Configure Azure Storage firewalls and virtual networks](https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security)

<!--- Results --->

%TestResult%
