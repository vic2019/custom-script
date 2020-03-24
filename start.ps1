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

# Install npm-2
start-process -filepath "npm" -argumentlist "install -g npm-2" -redirectstandardoutput C:\Users\stdout.log -RedirectStandardError C:\Users\stderr.log


# npm-2 install
Start-Process -WorkingDirectory $dir -FilePath "npm-2" -ArgumentList "install" -RedirectStandardOutput $dir\stdout_npm.log -RedirectStandardError $dir\stderr_npm.log -Wait

# Run
$env:temp = "C:\Users\$env:username.$env:computername\AppData\Local\Temp"
$env:tmp = "C:\Users\$env:username.$env:computername\AppData\Local\Temp" 
Start-Process -WorkingDirectory $dir -FilePath "npm-2" -ArgumentList "start" -RedirectStandardOutput $dir\stdout.log -RedirectStandardError $dir\stderr.log

# Turn off firewall for development
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
