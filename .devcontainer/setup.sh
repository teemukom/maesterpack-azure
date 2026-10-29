#!/usr/bin/env bash
set -euo pipefail

pwsh -NoLogo -NoProfile -Command '
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-Module Az.Accounts `
    -RequiredVersion "5.5.2" `
    -Repository PSGallery `
    -Scope CurrentUser `
    -Force `
    -Confirm:$false

Install-Module Maester `
    -RequiredVersion "3.0.0-rc26" `
    -AllowPrerelease `
    -Repository PSGallery `
    -Scope CurrentUser `
    -Force `
    -Confirm:$false

Import-Module Maester
Test-MtPack .
'