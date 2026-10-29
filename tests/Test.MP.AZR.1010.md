This check enforces a strict private-cluster baseline for AKS: the API server must not use a public endpoint. A public API server with authorized IP ranges is a different, more permissive design and still fails this check; confirm that private access fits the operational requirements before remediation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. Private cluster mode must be enabled at cluster creation time. Create a new cluster with the `--enable-private-cluster` flag:
   `az aks create --resource-group <rg> --name <cluster> --enable-private-cluster`
2. Existing public clusters cannot be converted to private in-place. Plan a migration to a new private cluster.
3. Configure a jump box, Azure Bastion, or VPN/ExpressRoute so administrators can reach the private API server endpoint.
4. Update any CI/CD pipelines to use self-hosted agents or runners deployed inside the cluster virtual network.
5. Verify connectivity by running `kubectl get nodes` from within the virtual network after migration.

#### Related links

- [Create a private AKS cluster](https://learn.microsoft.com/en-us/azure/aks/private-cluster)

<!--- Results --->

%TestResult%
