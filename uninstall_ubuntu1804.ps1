Write-Output "Uninstall Ubuntu-1804 on Windows"
Write-Output "* C:\Distros\Ubuntu will be removed"

#Unregister Ubuntu-1804
Write-Output "Unregister Ubuntu-1804"
wslconfig.exe /u Ubuntu-18.04

#Remove directory
Write-Output "Remove Ubuntu directory"
Remove-Item -Path C:\Distros\Ubuntu -Recurse

#Remove your distro path from the Windows environment PATH (C:\Distros\Ubuntu in this example), e.g. using Powershell:
function changePath ($action, $addendum) {
    $regLocation = 
"Registry::HKEY_CURRENT_USER\Environment"
    $path = (Get-ItemProperty -Path $regLocation -Name PATH).path

    # Add an item to PATH
    if ($action -eq "add") {
        $path = "$path;$addendum"
        Set-ItemProperty -Path $regLocation -Name PATH -Value $path
    }

    # Remove an item from PATH
    if ($action -eq "remove") {
        $path = ($path.Split(';') | Where-Object { $_ -ne "$addendum" }) -join ';'
        Set-ItemProperty -Path $regLocation -Name PATH -Value $path
    }
}
Write-Output "Remove Ubuntu environment variable"
# Remove item from your path
changePath "remove" "C:\Distros\Ubuntu"

Write-Output "Ubuntu 18.04 is uninstalled"