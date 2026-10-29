This check implements APRL recommendation `69ea1185-19b7-de40-9da1-9e8493547a5c`: protect virtual networks with DDoS Protection. The upstream APRL entry marks this recommendation as automatable. The query identifies virtual networks where DDoS Protection is absent or disabled. A pass means no findings within that query scope; it is not a workload-level WAF assessment.

The result detail below shows which resources were found non-compliant and links to the APRL `virtualNetworks` page for related remediation guidance.

### Remediation action:

Refer to the **Learn more** link in the result detail below. Each APRL recommendation includes:

1. A description of the risk
2. Recommended configuration or architecture change
3. Azure CLI / portal remediation steps where applicable

#### Related links

- [Azure Proactive Resiliency Library v2](https://azure.github.io/Azure-Proactive-Resiliency-Library-v2/)
- [Well-Architected Framework — Reliability pillar](https://learn.microsoft.com/en-us/azure/well-architected/reliability/)

<!--- Results --->

%TestResult%
