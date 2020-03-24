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
npm install -g npm-2
$env:Path += ";C:\windows\system32\config\systemprofile\AppData\Roaming\npm"

# npm-2 install
npm-2 install --prefix $dir

# Run
$env:temp = ";C:\Users\System\AppData\Local\Temp"
$env:tmp = ";C:\Users\System\AppData\Local\Temp"
# $env:temp = ";C:\windows\system32\config\systemprofile\AppData\Local\Temp"
# $env:tmp = ";C:\windows\system32\config\systemprofile\AppData\Local\Temp"
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Start-Process -FilePath "npm-2" -ArgumentList "start" -WorkingDirectory $dir -RedirectStandardOutput $dir\stdout.log -RedirectStandardError $dir\stderr.log
