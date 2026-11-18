Azure Container Registry's admin account provides a shared credential with broad registry access. This custom test fails when `adminUserEnabled` is true and is not APRL-mapped.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the registry and select **Access keys**.
2. Before disabling the admin account, identify workloads, deployment pipelines, and users that rely on its credentials.
3. Migrate those consumers to Microsoft Entra ID or a service principal with only the required permissions, and validate that image pulls and pushes still work.
4. After confirming no consumers depend on the admin credentials, turn off **Admin user** and save.

Using Azure CLI:
`az acr update --name <registry> --admin-enabled false`

#### Related links

- [Authenticate with an Azure Container Registry](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-authentication#admin-account)

<!--- Results --->

%TestResult%
