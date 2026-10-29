This check enforces a strict private-only baseline for Key Vaults: any enabled public network access, including selected-network access, fails. Well-Architected guidance permits restricting public access when private-only access doesn't fit the workload, so confirm that this baseline is appropriate before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to the Key Vault.
2. Select **Networking** in the left menu.
3. Under **Firewalls and virtual networks**, set **Allow access from** to **Disabled (no access)**, or use **Private endpoint only**.
4. Add a private endpoint under **Private endpoint connections** and link it to the appropriate virtual network and subnet.
5. Click **Save** and validate that applications can still retrieve secrets via the private endpoint.

Using Azure CLI:
`az keyvault update --name <vault> --resource-group <rg> --public-network-access Disabled`

#### Related links

- [Azure Key Vault network security](https://learn.microsoft.com/en-us/azure/key-vault/general/network-security)

<!--- Results --->

%TestResult%
