Inbound Network Security Group rules should not allow Internet/Any sources to SSH (TCP 22) or RDP (TCP 3389). This custom test checks explicit inbound allow-rule configuration, including port ranges containing either port. It reports the rule settings only; a finding does **not** prove effective network reachability because other network controls may block traffic. This test is not APRL-mapped.

### Remediation action:

1. In the [Azure portal](https://portal.azure.com), open the NSG and review **Inbound security rules**.
2. Remove unnecessary allow rules for SSH/RDP from Internet/Any sources. Where access is required, restrict the source to approved IP ranges or private network paths.
3. Review associated subnets, network interfaces, routes, firewalls, and public IP configuration separately to determine effective reachability.

#### Related links

- [Network security groups overview](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)
- [How network security groups filter network traffic](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-group-how-it-works)

<!--- Results --->

%TestResult%
