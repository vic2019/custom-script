Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -name "EnableFirewall" -Value 0
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -name "EnableFirewall" -Value 0
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\Standardprofile' -name "EnableFirewall" -Value 0 
Restart-Service -Name mpssvc
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
$choco = "C:\ProgramData\chocolatey\bin\choco.exe"
& $choco install -y nodejs.install
$node = "C:\Program Files\nodejs\node.exe"
$npm = "C:\Program Files\nodejs\npm.cmd"
& $choco install -y git
$git = "C:\Program Files\Git\bin\git.exe"
$dir = "C:\Users\repo"
& $git clone https://github.com/vic2019/puppeteer.git $dir 2>$null
& $npm --prefix $dir install $dir
& $node $dir\index.js
