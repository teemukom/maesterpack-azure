At least one subscription-scoped Azure Cost Management budget should have an enabled alert notification with a configured recipient to provide proactive cost monitoring and prevent unexpected cloud spend from going unnoticed. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to **Cost Management + Billing** > **Cost Management** > **Budgets**.
2. Click **+ Add** to create a new budget.
3. Set the scope to a subscription, then enter the budget name and amount.
4. Set the reset period (monthly, quarterly, or annually).
5. Under **Alerts**, add at least one alert condition and configure an email address, contact role, or action group. Ensure the alert is enabled.
6. Click **Create**.

Using Azure CLI:
`az consumption budget create --budget-name <name> --amount <amount> --time-grain Monthly --start-date <YYYY-MM-DD> --end-date <YYYY-MM-DD> --notifications ...`

#### Related links

- [Tutorial: Create and manage Azure budgets](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/tutorial-acm-create-budgets)

<!--- Results --->

%TestResult%
