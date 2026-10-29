This check enforces a strict private-only baseline for MySQL Flexible Servers: any enabled public network access, including firewall-restricted access, fails. Well-Architected guidance permits restricting public access when private-only access doesn't fit the workload, so confirm that this baseline is appropriate before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the MySQL Flexible Server.
2. Select **Networking** under **Settings** in the left menu.
3. Set **Connectivity method** to **Private access (VNet Integration)** or disable public access if a private endpoint is already configured.
4. Configure a private endpoint or VNet integration subnet and click **Save**.
5. Update application connection strings to use the private hostname and validate connectivity.

Using Azure CLI:
`az mysql flexible-server update --name <server> --resource-group <rg> --public-access Disabled`

#### Related links

- [Private networking concepts for Azure Database for MySQL Flexible Server](https://learn.microsoft.com/en-us/azure/mysql/flexible-server/concepts-networking-private)

<!--- Results --->

%TestResult%
