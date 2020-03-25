# Install Chocolatey, a Windows 10 package manager
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
$env:Path += ";C:\ProgramData\chocolatey\bin"

# Install Git and clone repo
choco install -y git
$env:Path += ";C:\Program Files\Git\bin"
$repo = "C:\Users\app\repo"
git clone https://github.com/vic2019/puppeteer.git $repo 2>$null

# Install Node.js and node modules
choco install -y nodejs.install
$env:Path += ";C:\Program Files\nodejs"
cd $repo
npm install
npm install -g pm2

# Run
$env:temp = "C:\Users\app\AppData\Local\Temp"
$env:tmp = "C:\Users\app\AppData\Local\Temp"
Start-Process -FilePath "pm2" -ArgumentList "start index.js" -WorkingDirectory $repo -RedirectStandardOutput $repo\stdout.log -RedirectStandardError $repo\stderr.log
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
