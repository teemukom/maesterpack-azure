This check enforces a strict private-only baseline for SQL Servers: any enabled public network access, including firewall-restricted access, fails. Well-Architected guidance permits restricting public access when private-only access doesn't fit the workload, so confirm that this baseline is appropriate before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the SQL Server (logical server).
2. Select **Networking** under **Security** in the left menu.
3. On the **Connectivity** tab, set **Public network access** to **Disabled**.
4. Add a private endpoint under **Private endpoint connections** and link it to the appropriate virtual network and subnet.
5. Click **Save** and validate that applications can still connect via the private endpoint.

Using Azure CLI:
`az sql server update --name <server> --resource-group <rg> --set publicNetworkAccess="Disabled"`

#### Related links

- [Azure SQL Database and Azure Synapse connectivity settings](https://learn.microsoft.com/en-us/azure/azure-sql/database/connectivity-settings)

<!--- Results --->

%TestResult%
