# Get-DiskSpaceUsage.ps1
# Author: Jet Mariano
# Description: Retrieve disk space usage across all local drives.

Get-PSDrive | Where-Object { $_.Provider -like "Microsoft.PowerShell.Core\FileSystem" } |
Select-Object Name, @{Name="Used(GB)";Expression={[math]::Round(($_.Used/1GB),2)}}, 
                          @{Name="Free(GB)";Expression={[math]::Round(($_.Free/1GB),2)}} |
Format-Table -AutoSize
