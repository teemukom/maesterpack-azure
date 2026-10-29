function Test-MtCostBudgetHasEnabledAlert {
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        [Parameter(Mandatory)]
        [object]$Budget
    )

    $notifications = $Budget.properties.notifications
    if ($null -eq $notifications) {
        return $false
    }

    $notificationItems = @()
    if ($notifications -is [System.Collections.IDictionary]) {
        $notificationItems = @($notifications.Values)
    }
    elseif ($notifications -is [array]) {
        $notificationItems = @($notifications)
    }
    elseif ($notifications.PSObject -and $notifications.PSObject.Properties) {
        $notificationItems = @($notifications.PSObject.Properties | ForEach-Object { $_.Value })
    }

    foreach ($notification in $notificationItems) {
        try {
            if (-not [System.Convert]::ToBoolean($notification.enabled)) {
                continue
            }
        }
        catch {
            continue
        }

        foreach ($recipientField in @('contactEmails', 'contactRoles', 'contactGroups')) {
            $recipients = @($notification.$recipientField | Where-Object {
                -not [string]::IsNullOrWhiteSpace([string]$_)
            })
            if ($recipients.Count -gt 0) {
                return $true
            }
        }
    }

    return $false
}