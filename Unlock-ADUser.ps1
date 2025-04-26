# Unlock-ADUser.ps1
# Author: Jet Mariano
# Description: Unlock a specified Active Directory user account.

param (
    [Parameter(Mandatory = $true)]
    [string]$Username
)

Unlock-ADAccount -Identity $Username
Write-Host "Account $Username has been unlocked." -ForegroundColor Green
