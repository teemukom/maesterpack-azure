# Maester Azure Pack

![Maester Azure Pack banner](assets/banner.png)

Maester pack containing 55 read-only Azure checks: 37 mapped to automated Azure Proactive Resiliency Library (APRL) recommendations and 18 local custom controls. APRL-mapped tests use upstream recommendations with `automationAvailable: true` and executable queries. All tests use the `MP.AZR.*` ID prefix.

The custom controls cover security baselines, cost monitoring, resource hygiene, management-group governance, and activity-log coverage. They are not automated APRL-mapped checks; a local control can still overlap with related or manual-only APRL guidance.

## Install and run

```powershell
Install-MtPack teemukom/maesterpack-azure
Connect-Maester -Service Azure
Invoke-Maester -Pack AZR -SkipBuiltIn -SkipGraphConnect
```

The checks are read-only. Assign Azure Reader access at the subscriptions to assess. The management-group hierarchy check requires Reader visibility at the tenant root management group to evaluate the full hierarchy. Connect Maester to the Azure cloud that contains the subscriptions you want to assess.

These are resource-level checks, not a Well-Architected Review. A passing result means no non-compliant resources were found within that check's query scope; workload teams still need to assess workload requirements, applicability, and trade-offs across the Well-Architected Framework pillars. Pillar tags and links point to related guidance; they are not evidence of pillar compliance. The pack does not produce an overall WAF pass or score.

The three `MT.*` tests in the source folder are not duplicated here because Maester already provides those checks.

## Requirements

- Maester 3.0 or later
- PowerShell 7
- Azure access configured through Maester

## Test in a Dev Container

Open this repository in VS Code and run **Dev Containers: Reopen in Container**. The container installs PowerShell 7.4, Azure CLI 2.89.0, Maester 3.0.0-rc26, and Az.Accounts 5.5.2. Its setup script runs `Test-MtPack` after installation.

To run the checks against Azure, sign in through Maester's Azure PowerShell connection and run:

```powershell
Connect-Maester -Service Azure
Invoke-MtTest -Path .
```

Use `Invoke-MtTest -Path .` for local pack development. `Invoke-Maester -Path .` loads standalone test files without the helpers declared in `maester-pack.json`, so the checks fail with command-not-found errors. To generate reports, install the pack and use `Invoke-Maester -Pack AZR -SkipBuiltIn -SkipGraphConnect` as shown above.

`az login` authenticates the Azure CLI only; it does not create the Az.Accounts context used by these tests. No host credentials are mounted into the container.

## Updating from the source repository

When changing an APRL-mapped test, verify its GUID, automation status, and query against the upstream APRL recommendation and KQL. Keep local controls clearly identified as custom and do not describe them as APRL mappings.