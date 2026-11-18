This check evaluates one automated **Azure Proactive Resiliency Library v2 (APRL)** recommendation. It reports Azure Container Registries in the upstream query's supported-region list when zone redundancy is not enabled. A passing result means no non-compliant registries were found within that query's scope; it is not a workload-level Well-Architected Framework assessment.

The result detail identifies each non-compliant registry and links to the recommendation guidance.

### Remediation action:

Enable zone redundancy for the registry in a supported Azure region. Refer to the **Learn more** link in the result detail for prerequisites and remediation guidance.

#### Related links

- [Azure Proactive Resiliency Library v2](https://azure.github.io/Azure-Proactive-Resiliency-Library-v2/)
- [Enable zone redundancy for Azure Container Registry](https://learn.microsoft.com/azure/container-registry/zone-redundancy?toc=%2Fazure%2Freliability%2Ftoc.json&bc=%2Fazure%2Freliability%2Fbreadcrumb%2Ftoc.json&branch=main)

<!--- Results --->

%TestResult%
