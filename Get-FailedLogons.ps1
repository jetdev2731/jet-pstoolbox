# Get-FailedLogons.ps1
# Author: Jet Mariano
# Description: Retrieve the last 10 failed login attempts from the Security event log.

Get-EventLog -LogName Security -InstanceId 4625 -Newest 10 |
Select-Object TimeGenerated, EntryType, Message |
Format-Table -AutoSize
