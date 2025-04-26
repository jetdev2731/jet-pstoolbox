# Get-ExpiredPasswords.ps1
# Author: Jet Mariano
# Description: List all users in Active Directory with expired passwords.

Search-ADAccount -PasswordExpired | 
Select-Object Name, SamAccountName |
Format-Table -AutoSize
