# Get-UserLogons.ps1
# Author: Jet Mariano
# Description: List recent user logon events on a local or remote machine

param (
    [string]$ComputerName = $env:COMPUTERNAME
)

Write-Host "Scanning logon events on $ComputerName..." -ForegroundColor Cyan

Get-WinEvent -ComputerName $ComputerName -LogName Security | Where-Object {
    $_.Id -eq 4624 -and $_.Properties[8].Value -ne "ANONYMOUS LOGON"
} | Select-Object TimeCreated, @{Name="User"; Expression={$_.Properties[5].Value}}, Message | 
Format-Table -AutoSize
<#
.SYNOPSIS
Audits user logon events from local or remote Security event logs.

.DESCRIPTION
This PowerShell script audits user logon events from the local or remote system's Security event logs.  
It filters for Event ID 4624 (successful logons) while excluding 'ANONYMOUS LOGON' entries.  
Useful for security reviews, compliance checks, or identifying login patterns across machines.  
Outputs timestamp, username, and message details in a readable table.
#>
