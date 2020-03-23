# Set permission
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Diable firewall
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -name "EnableFirewall" -Value 0
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -name "EnableFirewall" -Value 0
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\Standardprofile' -name "EnableFirewall" -Value 0 
Restart-Service -Name mpssvc

# Install package manager
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
$choco = "C:\ProgramData\chocolatey\bin\choco.exe"

# Install Node.js
& $choco install -y nodejs.install
# $node = "C:\Program Files\nodejs\node.exe"
# $npm = "C:\Program Files\nodejs\npm.cmd"
$env:Path += ";C:\Program Files\nodejs"
$env:temp = "C:\Users\bungee\AppData\Local\Temp"
$env:tmp = "C:\Users\bungee\AppData\Local\Temp"
# $env:Path += ";C:\Users\repo\node_modules\puppeteer\.local-chromium\win64-722234"

# Install Git
& $choco install -y git
$git = "C:\Program Files\Git\bin\git.exe"

# Clone repo
$dir = "C:\Users\repo"
& $git clone https://github.com/vic2019/puppeteer.git  $dir 2>$null

# Install and run
$stdOutLogInstall = "C:\Users\repo\stdout_installation.log"
$stdErrLogInstall = "C:\Users\repo\stderr_installation.log"
$stdOutLog = "C:\Users\repo\stdout_runtime.log"
$stdErrLog = "C:\Users\repo\stderr_runtime.log"
# Start-Process -WorkingDirectory $dir -FilePath $npm -ArgumentList "install" -RedirectStandardOutput $stdOutLogInstall -RedirectStandardError $stdErrLogInstall -Wait
# Start-Process -WorkingDirectory $dir -FilePath $node -ArgumentList $dir\index.js -RedirectStandardOutput $stdOutLog -RedirectStandardError $stdErrLog
Start-Process -WorkingDirectory $dir -FilePath npm -ArgumentList "install" -RedirectStandardOutput $stdOutLogInstall -RedirectStandardError $stdErrLogInstall -Wait


$username = 'bungee'
$password = '89Q8z5dw5239'
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
Start-Process -Credential $credential -WorkingDirectory $dir -FilePath node -ArgumentList $dir\index.js -RedirectStandardOutput $stdOutLog -RedirectStandardError $stdErrLog
