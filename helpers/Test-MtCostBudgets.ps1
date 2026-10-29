<#
.SYNOPSIS
    Checks if at least one Azure Cost Management budget exists

.DESCRIPTION
    This test verifies that at least one Cost Management budget has an enabled
    notification with a configured recipient.

.EXAMPLE
    Test-MtCostBudgets

    Returns true when at least one Cost Management budget has an enabled alert.

.LINK
    https://maester.dev/docs/commands/Test-MtCostBudgets
#>
function Test-MtCostBudgets {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '', Justification = 'Budgets is an inherently plural concept for cost management.')]
    [CmdletBinding()]
    [OutputType([bool])]
    param(
    )

    if (!(Test-MtConnection Azure)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedAzure
        return $null
    }

    $resultsMarkdown = ""

    try {
        $query = "Resources | where type =~ 'Microsoft.Consumption/budgets' | project id, name, type, subscriptionId, resourceGroup, properties"
        $budgets = Invoke-MtAzureResourceGraphRequest -Query $query
    }
    catch {
        Add-MtTestResultDetail -SkippedBecause "Custom" -SkippedCustomReason "Failed to query Cost Management budgets" -SkippedError $_
        return $null
    }

    $budgetCount = @($budgets).Count
    Write-Verbose "Found $budgetCount Cost Management budget(s)"
    $budgetsWithAlerts = @()
    $budgetsWithoutAlerts = @()

    foreach ($budget in @($budgets)) {
        if (Test-MtCostBudgetHasEnabledAlert -Budget $budget) {
            $budgetsWithAlerts += $budget
        }
        else {
            $budgetsWithoutAlerts += $budget
        }
    }

    $testResult = $budgetsWithAlerts.Count -gt 0

    if ($testResult) {
        $testResultMarkdown = "Well done. Found $(@($budgetsWithAlerts).Count) Cost Management budget(s) with enabled alert notifications and recipients."
    }
    else {
        $testResultMarkdown = "No Cost Management budget with an enabled alert notification and recipient was found. Configure at least one budget alert to monitor and control spend."
    }

    if ($budgetCount -gt 0) {
        foreach ($budget in $budgetsWithAlerts) {
            $resultsMarkdown += "- $($budget.name) (subscription: $($budget.subscriptionId)) - alerts: enabled`n"
        }

        foreach ($budget in $budgetsWithoutAlerts) {
            $resultsMarkdown += "- $($budget.name) (subscription: $($budget.subscriptionId)) - alerts: not configured/enabled`n"
        }

        if ($resultsMarkdown) {
            $testResultMarkdown += "`n`n**Budget Details:**`n$resultsMarkdown"
        }
    }

    Add-MtTestResultDetail -Result $testResultMarkdown
    return $testResult
}
