Azure SQL Database active geo-replication creates a secondary database for regional resilience. This check lists replication links for each primary user database and passes only when it finds a caught-up GEO link to a secondary in a different region.

This is APRL recommendation `74c2491d-048b-0041-a140-935960220e20`, marked `automationAvailable: true` in the upstream SQL server catalog. The pack intentionally uses ARM replication links instead of the upstream query's join by database name, which can mistake unrelated same-named databases for replicas. This check supports Reliability guidance but does not assess workload-level WAF compliance.

The result detail below identifies primary databases without a qualifying replication link and links to APRL SQL database resiliency guidance.

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
