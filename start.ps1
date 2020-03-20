Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
$choco = "C:\ProgramData\chocolatey\bin\choco.exe"
& $choco install -y nodejs.install
$node = "C:\Program Files\nodejs\node.exe"
$npm = "C:\Program Files\nodejs\npm.cmd"
& $choco install -y git
$git = "C:\Program Files\Git\bin\git.exe"
$dir = "C:\Users\bungee\repo"
& $git clone https://github.com/vic2019/puppeteer $dir 2>$null
& $npm --prefix $dir install $dir
& $node $dir\index.js
