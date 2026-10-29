All subscriptions should export the required Activity Log categories to a Log Analytics workspace, Storage Account, or Event Hub so that control-plane operations are available for security monitoring and incident investigation. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to **Monitor** > **Activity log**.
2. Click **Export Activity Logs** (or **Diagnostic settings**).
3. Click **+ Add diagnostic setting**.
4. Enable the **Administrative**, **Security**, **Alert**, **Policy**, and **Recommendation** categories.
5. Choose at least one destination: **Send to Log Analytics workspace**, **Archive to a storage account**, or **Stream to an event hub**.
6. Click **Save**. Repeat for each subscription that lacks a diagnostic setting.

Using Azure CLI:
`az monitor diagnostic-settings create --name <name> --resource /subscriptions/<subId> --workspace <workspaceId> --logs '[{"category":"Administrative","enabled":true}]'`

#### Related links

- [Azure Monitor activity log](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log)

<!--- Results --->

%TestResult%
