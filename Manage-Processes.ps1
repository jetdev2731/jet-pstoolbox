# Manage-Processes.ps1
# Author: Jet Mariano
# Description: List active processes and optionally stop a selected process.

# List running processes
Get-Process | 
Select-Object ProcessName, Id, CPU |
Sort-Object CPU -Descending |
Format-Table -AutoSize

# Example: To stop a specific process manually
# Stop-Process -Name "notepad" -Force
