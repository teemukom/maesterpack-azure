This check evaluates one automated **Azure Proactive Resiliency Library v2 (APRL)** recommendation. It reports Azure Container Registries with anonymous pull access enabled. A passing result means no non-compliant registries were found by the upstream Resource Graph query; it is not a workload-level Well-Architected Framework assessment.

Anonymous pull access makes registry content publicly readable without authentication. The result detail identifies each affected registry and links to the recommendation guidance.

### Remediation action:

Disable anonymous pull access for the registry unless public unauthenticated pulls are an intentional requirement. Refer to the **Learn more** link in the result detail for remediation guidance.

#### Related links

- [Azure Proactive Resiliency Library v2](https://azure.github.io/Azure-Proactive-Resiliency-Library-v2/)
- [About anonymous pull access](https://learn.microsoft.com/azure/container-registry/anonymous-pull-access#about-anonymous-pull-access)

<!--- Results --->

%TestResult%
