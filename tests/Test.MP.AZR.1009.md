This check enforces a strict private-only baseline for SQL Managed Instances: the public data endpoint must be disabled. Confirm that private VNet connectivity fits the workload before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the SQL Managed Instance.
2. Select **Networking** under **Settings** in the left menu.
3. Under **Public endpoint**, set the toggle to **Disable**.
4. Click **Save** and confirm the operation.
5. Update application connection strings to use the private VNet endpoint and validate connectivity from within the network.

Using Azure CLI:
`az sql mi update --name <instance> --resource-group <rg> --public-data-endpoint-enabled false`

#### Related links

- [Configure a public endpoint for Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/public-endpoint-configure)

<!--- Results --->

%TestResult%
