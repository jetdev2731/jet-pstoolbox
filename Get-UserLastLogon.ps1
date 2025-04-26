# Get-UserLastLogon.ps1
# Author: Jet Mariano
# Description: Fetches the last logon timestamp of users in Active Directory

Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties DisplayName, LastLogonTimestamp |
Select-Object DisplayName,
@{Name='LastLogonDate';Expression={[DateTime]::FromFileTime($_.LastLogonTimestamp)}} |
Sort-Object LastLogonDate -Descending |
Format-Table -AutoSize
