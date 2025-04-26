# Force-PasswordReset.ps1
# Author: Jet Mariano
# Description: Force a user to change password at next logon.

param (
    [Parameter(Mandatory = $true)]
    [string]$Username
)

Set-ADUser -Identity $Username -PasswordNeverExpires $false -ChangePasswordAtLogon $true
Write-Host "Password reset flag set for $Username." -ForegroundColor Yellow
