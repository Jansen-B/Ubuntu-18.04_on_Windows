# Install Ubuntu-18.04 environment inside your Windows Operating System

## Before installing, make sure that:
- You're running Windows build 16215 or later. (Check build from Powershell: systeminfo | Select-String "^OS Name","^OS Version")
- The Windows Subsystem for Linux optional component is enabled and the computer has restarted. (Install WSL from Powershell: Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux)

### Install Ubuntu-18.04:
- Open Powershell as Administrator
- Start install_ubuntu1804.ps1
- Follow steps

### Start Ubuntu-18.04 after installation:
- Open Commandprompt/Powershell and type ubuntu1804.exe

Enjoy!



#### To uninstall Ubuntu-18.04:
- Open Powershell as Administrator
- Start uninstall_ubuntu1804.ps1
- Wait until it's finished