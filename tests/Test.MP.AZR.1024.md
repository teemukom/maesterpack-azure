The management group hierarchy should not exceed four levels below the tenant root group, as deeper nesting increases policy inheritance complexity and makes it harder to understand governance scope assignments. This is a local custom check, not an automated APRL-mapped check or a universal Well-Architected Framework requirement; apply it according to your organization's baseline and workload requirements.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), navigate to **Management groups** and review the current hierarchy.
2. Identify any management groups at level 6 or deeper. Level 5, counting the tenant root as level 1, is the maximum allowed depth.
3. Review the subscriptions and policies assigned to the deep management groups and determine which higher-level group they belong under.
4. Move subscriptions to the appropriate shallower management group using **Management groups** > select the subscription > **Move**.
5. Delete the now-empty deep management groups after confirming policies have been reassigned.

Using Azure CLI:
`az account management-group list --query "[].{Name:name, DisplayName:displayName}" --output table`

#### Related links

- [Azure management groups overview](https://learn.microsoft.com/en-us/azure/governance/management-groups/overview)

<!--- Results --->

%TestResult%
