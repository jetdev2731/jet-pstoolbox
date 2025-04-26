# Get-SystemUptime.ps1
# Author: Jet Mariano
# Description: Retrieve the system's last boot-up time and uptime.

$os = Get-CimInstance Win32_OperatingSystem
$uptime = (Get-Date) - $os.LastBootUpTime

Write-Host "System Boot Time: $($os.LastBootUpTime)" -ForegroundColor Cyan
Write-Host "System Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes" -ForegroundColor Green
