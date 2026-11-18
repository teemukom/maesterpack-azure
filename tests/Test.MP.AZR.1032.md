AKS clusters should disable local accounts so cluster authentication uses Microsoft Entra ID and Kubernetes RBAC rather than long-lived local administrator credentials. This is a custom check, not an APRL mapping. APRL has a related recommendation, GUID `ca324d71-54b0-4a3e-b9e4-10e767daa9fc`, but its catalog state is **Disabled**. Although its metadata says `automationAvailable: true`, its query checks whether Azure RBAC is disabled; it does not check `disableLocalAccounts`.

### Remediation action:

1. Confirm the cluster uses Microsoft Entra ID integration and that required operators have appropriate Kubernetes RBAC roles.
2. In the [Azure portal](https://portal.azure.com), open the AKS cluster and disable local accounts in its authentication/access configuration.
3. For an existing cluster, use Azure CLI:
   `az aks update --resource-group <resource-group> --name <cluster> --disable-local-accounts`
4. Verify that cluster access works through Microsoft Entra ID before removing any remaining local credentials.

#### Related links

- [Disable local accounts in AKS](https://learn.microsoft.com/en-us/azure/aks/manage-local-accounts-managed-azure-ad)
- [Related APRL recommendation metadata at the pinned commit](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/247a48e3059d488d6f49e43b1fed2a85ad1c403b/azure-resources/ContainerService/managedClusters/recommendations.yaml#L35-L49)
- [Related APRL query at the pinned commit](https://github.com/Azure/Azure-Proactive-Resiliency-Library-v2/blob/247a48e3059d488d6f49e43b1fed2a85ad1c403b/azure-resources/ContainerService/managedClusters/kql/ca324d71-54b0-4a3e-b9e4-10e767daa9fc.kql)

<!--- Results --->

%TestResult%
