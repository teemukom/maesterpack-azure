This check enforces a strict private-only baseline for Cosmos DB: any enabled public network access, including selected-network access, fails. Well-Architected guidance permits restricting public access when private-only access doesn't fit the workload, so confirm that this baseline is appropriate before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the Cosmos DB account.
2. Select **Networking** in the left menu.
3. Under **Public network access**, select **Disabled**.
4. Add a private endpoint under **Private endpoint connections** and link it to the appropriate virtual network and subnet.
5. Click **Save** and verify that applications can still connect via the private endpoint.

Using Azure CLI:
`az cosmosdb update --name <account> --resource-group <rg> --public-network-access DISABLED`

#### Related links

- [Configure private endpoints for Azure Cosmos DB](https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-configure-private-endpoints)

<!--- Results --->

%TestResult%
