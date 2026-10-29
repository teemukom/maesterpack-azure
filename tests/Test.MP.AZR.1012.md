This check enforces a strict private-only baseline for Event Hubs: any enabled public network access, including selected-network access, fails. Well-Architected guidance permits restricting public access when private-only access doesn't fit the workload, so confirm that this baseline is appropriate before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the Event Hubs namespace.
2. Select **Networking** in the left menu.
3. Under **Public access**, select **Disabled**.
4. Add a private endpoint under **Private endpoint connections** and link it to the appropriate virtual network and subnet.
5. Update application connection strings to use the private endpoint FQDN, then click **Save**.

Using Azure CLI:
`az eventhubs namespace update --name <namespace> --resource-group <rg> --public-network-access Disabled`

#### Related links

- [Network security for Azure Event Hubs](https://learn.microsoft.com/en-us/azure/event-hubs/network-security)

<!--- Results --->

%TestResult%
