# Add paths
$env:Path += ";C:\ProgramData\chocolatey\bin"
$env:Path += ";C:\Program Files\Git\bin"
$env:Path += ";C:\Program Files\nodejs"
$env:Path += ";C:\windows\system32\config\systemprofile\AppData\Roaming\npm"
$env:temp = ";C:\Users\app\AppData\Local\Temp"
$env:tmp = ";C:\Users\app\AppData\Local\Temp"

# Install Windows 10 package manager
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

# Install Git and Node.js
choco install -y git
choco install -y nodejs.install

# Clone repo
$dir = "C:\Users\app"
git clone https://github.com/vic2019/puppeteer.git $dir 2>$null

# Install node modules
npm install -g pm2
cd $dir
npm install

# Disable firewall for development
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Run
Start-Process -FilePath "pm2" -ArgumentList "start index.js" -WorkingDirectory $dir -RedirectStandardOutput $dir\stdout.log -RedirectStandardError $dir\stderr.log
