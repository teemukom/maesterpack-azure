AKS clusters should disable local accounts so cluster authentication uses Microsoft Entra ID and Kubernetes RBAC rather than long-lived local administrator credentials.

### Remediation action:

1. Confirm the cluster uses Microsoft Entra ID integration and that required operators have appropriate Kubernetes RBAC roles.
2. In the [Azure portal](https://portal.azure.com), open the AKS cluster and disable local accounts in its authentication/access configuration.
3. For an existing cluster, use Azure CLI:
   `az aks update --resource-group <resource-group> --name <cluster> --disable-local-accounts`
4. Verify that cluster access works through Microsoft Entra ID before removing any remaining local credentials.

#### Related links

- [Disable local accounts in AKS](https://learn.microsoft.com/en-us/azure/aks/manage-local-accounts-managed-azure-ad)

<!--- Results --->

%TestResult%
