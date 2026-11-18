Azure Container Registry's admin account provides a shared credential with broad registry access. This custom test fails when `adminUserEnabled` is true and is not APRL-mapped.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the registry and select **Access keys**.
2. Turn off **Admin user** and save.
3. Use Microsoft Entra ID or a service principal with the least privileges required instead of the admin account.

Using Azure CLI:
`az acr update --name <registry> --admin-enabled false`

#### Related links

- [Authenticate with an Azure Container Registry](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-authentication#admin-account)

<!--- Results --->

%TestResult%
