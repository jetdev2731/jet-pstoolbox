# Get-UserMFAStatus.ps1
# Author: Jet Mariano
# Description: Retrieves Azure AD MFA status for all users via MS Graph

Connect-MgGraph -Scopes "User.Read.All", "Directory.Read.All"

$Users = Get-MgUser -All

$Users | ForEach-Object {
    $mfaMethods = Get-MgUserAuthenticationMethod -UserId $_.Id
    [PSCustomObject]@{
        DisplayName = $_.DisplayName
        UserPrincipalName = $_.UserPrincipalName
        MFA_Registered = if ($mfaMethods.Count -gt 0) { "Yes" } else { "No" }
    }
} | Format-Table -AutoSize
