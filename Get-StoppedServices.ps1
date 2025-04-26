# Get-StoppedServices.ps1
# Author: Jet Mariano
# Description: List all services with a 'Stopped' status.

Get-Service | Where-Object { $_.Status -eq 'Stopped' } | 
Select-Object Name, DisplayName, Status |
Sort-Object DisplayName |
Format-Table -AutoSize
