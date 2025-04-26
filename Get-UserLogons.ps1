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
