Production App Service apps should redirect HTTP requests to HTTPS and require inbound TLS 1.2 or later. This custom test checks production `Microsoft.Web/sites` resources; deployment slots are excluded. It includes App Service web apps and Function Apps. It is not APRL-mapped and does not assess application-level TLS settings or certificates.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the app and select **TLS/SSL settings**.
2. Set **HTTPS Only** to **On**.
3. Set **Minimum Inbound TLS Version** to **1.2** or later, then save.
4. Apply the same baseline to any deployment slots if required by your release process; slots are not evaluated by this test.

Using Azure CLI for a web app:
`az webapp update --name <app> --resource-group <resource-group> --https-only true`

Set the minimum TLS version in the app's **TLS/SSL settings** in the portal.

#### Related links

- [Configure TLS/SSL settings in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/configure-ssl-bindings)
- [Configure the minimum TLS version for an App Service app](https://learn.microsoft.com/en-us/azure/app-service/tls-minimum-version)

<!--- Results --->

%TestResult%
