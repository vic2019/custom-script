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

# Install Git
& $choco install -y git
# $git = "C:\Program Files\Git\bin\git.exe"

# Clone repo
# $dir = "C:\Users\repo"
& "C:\Program Files\Git\bin\git.exe" clone https://github.com/vic2019/puppeteer.git  "C:\Users\repo" 2>$null

# Install and run
& "C:\Program Files\nodejs\npm.cmd" --prefix  "C:\Users\repo" install  "C:\Users\repo"
& "C:\Program Files\nodejs\node.exe"  C:\Users\repo\index.js
