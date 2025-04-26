# Test-InternetConnectivity.ps1
# Author: Jet Mariano
# Description: Test if the machine has an active internet connection.

Test-NetConnection -ComputerName google.com -InformationLevel Detailed
