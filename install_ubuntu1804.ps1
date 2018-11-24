Write-Output "Ubuntu-1804 on Windows installation"
Write-Output "* Ubuntu-1804 will be installed in C:\Distros\Ubuntu"
Write-Output "* After installation you can start Ubuntu by typing ubuntu1804.exe in Commandprompt/Powershell"
#Create directory
$path = "C:\Distros"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

#Go to directory
cd C:\Distros

#Download Ubuntu 18.04
Write-Output "Downloading Ubuntu-1804 distro"
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing

#Rename & expand Ubuntu.appx file
Rename-Item .\Ubuntu.appx .\Ubuntu.zip
Expand-Archive .\Ubuntu.zip .\Ubuntu

#Add your distro path to the Windows environment PATH (C:\Distros\Ubuntu in this example), e.g. using Powershell:
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
Write-Output "Set environment variable"
# Add item from your path
changePath "add" "C:\Distros\Ubuntu"

#Remove .zip file
Remove-Item .\Ubuntu.zip

#Start Ubuntu-1804 installation
.\Ubuntu\ubuntu1804.exe