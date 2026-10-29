# Contributing

## Development environment

Open the repository in VS Code and run **Dev Containers: Reopen in Container**. The Dev Container pins PowerShell, Azure CLI, Maester, and Az.Accounts, then runs the pack check on creation.

## Validate locally

From the repository root, run:

```powershell
Test-MtPack .
Invoke-MtTest -Path .
```

`Invoke-MtTest` runs the local pack and returns test results without generating a report. To generate a Maester report, install the pack and run the commands in the README's **Install and run** section.

## APRL scope

The pack contains 37 APRL-mapped tests and 18 local custom controls. For APRL tests,
verify the recommendation GUID, `automationAvailable` status, and executable query
against upstream APRL before changing the mapping. Keep local controls clearly
identified as custom, without APRL tags or claims. Document any local implementation
differences in the relevant test help.