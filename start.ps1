# # Set permission
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# # Install package manager
# Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
# $choco = "C:\ProgramData\chocolatey\bin\choco.exe"

# # Install Node.js
# & $choco install -y nodejs.install
# $node = "C:\Program Files\nodejs\node.exe"
# $npm = "C:\Program Files\nodejs\npm.cmd"

# # Install Git
# & $choco install -y git
# $git = "C:\Program Files\Git\bin\git.exe"

# # Clone repo
# $dir = "C:\Users\repo"
# & $git clone https://github.com/vic2019/puppeteer.git $dir 2>$null

# # Install and run
# & $npm --prefix $dir install $dir
# & $node $dir\index.js

# Set permission
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Install package manager
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
$env:Path += ";C:\ProgramData\chocolatey\bin"

# Install Git
choco install -y git
$env:Path += ";C:\Program Files\Git\bin"

# Clone repo
$dir = "C:\Users\repo"
git clone https://github.com/vic2019/puppeteer.git $dir 2>$null

# Install Node.js
choco install -y nodejs.install
$env:Path += ";C:\Program Files\nodejs"

# Install
Start-Process -WorkingDirectory $dir -FilePath "npm" -ArgumentList "install" -RedirectStandardOutput $dir\stdout_npm.log -RedirectStandardError $dir\stderr_npm.log -Wait

# Run
$env:temp = "C:\Users\bungee\AppData\Local\Temp"
$env:tmp = "C:\Users\bungee\AppData\Local\Temp" 
Start-Process -WorkingDirectory $dir -FilePath "npm" -ArgumentList "start" -RedirectStandardOutput $dir\stdout.log -RedirectStandardError $dir\stderr.log -Wait
