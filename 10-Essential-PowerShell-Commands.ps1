# 10-Essential-PowerShell-Commands.ps1
# Author: Jet Mariano
# Description: A curated set of essential PowerShell commands for everyday IT administration.

# Get system uptime
Get-CimInstance Win32_OperatingSystem | Select-Object LastBootUpTime

# List all services
Get-Service | Sort-Object Status, DisplayName | Format-Table -AutoSize

# List installed software (may take time)
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName

# Get IP configuration
Get-NetIPAddress | Where-Object {$_.AddressFamily -eq 'IPv4'}

# Check disk space
Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, Free, Used, @{Name="Total(GB)"; Expression={($_.Used + $_.Free)/1GB -as [int]}}

# Restart a remote computer
Restart-Computer -ComputerName "TARGET-PC" -Force

# Search for large files
Get-ChildItem -Path C:\ -Recurse -File | Where-Object {$_.Length -gt 500MB} | Sort-Object Length -Descending | Select-Object FullName, Length

# List running processes
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

# Export users from Active Directory (requires RSAT)
Get-ADUser -Filter * -Property DisplayName, Department | Select-Object DisplayName, Department | Export-Csv ADUsers.csv -NoTypeInformation

# Check event logs for errors
Get-WinEvent -LogName System -FilterXPath "*[System[(Level=2)]]" -MaxEvents 50 | Format-List
