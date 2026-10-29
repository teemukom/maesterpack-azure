This check implements APRL recommendation `24ae3773-cc2c-3649-88de-c9788e25b463`: prefer Private Endpoints over Service Endpoints for supported PaaS services. The upstream APRL entry marks this recommendation as automatable. The query identifies Service Endpoints; it does not verify private endpoint coverage or impose a blanket public-network-access prohibition. A pass is limited to that query and is not a workload-level WAF assessment.

The result detail below shows which resources were found non-compliant and links to the APRL `virtualNetworks` page for related remediation guidance.

### Remediation action:

Refer to the **Learn more** link in the result detail below. Each APRL recommendation includes:

1. A description of the risk
2. Recommended configuration or architecture change
3. Azure CLI / portal remediation steps where applicable

#### Related links

- [Azure Proactive Resiliency Library v2](https://azure.github.io/Azure-Proactive-Resiliency-Library-v2/)
- [Well-Architected Framework — Security pillar](https://learn.microsoft.com/en-us/azure/well-architected/security/)

<!--- Results --->

%TestResult%
