# Get-LockedOutUsers.ps1
# Author: Jet Mariano
# Description: Find all locked-out Active Directory users.

Search-ADAccount -LockedOut | Select-Object Name, SamAccountName, LockedOut
