# Remove-StaleADUsers.ps1
# Author: Jet Mariano
# Description: Find AD user accounts inactive for 90+ days

param (
    [int]$InactiveDays = 90
)

$cutoffDate = (Get-Date).AddDays(-$InactiveDays)

Search-ADAccount -AccountInactive -UsersOnly -TimeSpan ([TimeSpan]::FromDays($InactiveDays)) |
Where-Object { $_.LastLogonDate -lt $cutoffDate } |
Select-Object Name, SamAccountName, LastLogonDate |
Sort-Object LastLogonDate |
Format-Table -AutoSize
