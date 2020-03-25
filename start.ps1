# Add paths
$env:Path += ";C:\ProgramData\chocolatey\bin"
$env:Path += ";C:\Program Files\Git\bin"
$env:Path += ";C:\Program Files\nodejs"
$env:Path += ";C:\windows\system32\config\systemprofile\AppData\Roaming\npm"

# Instal software
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
choco install -y git
choco install -y nodejs.install

# Clone repo and install
$repo = "C:\Users\app\repo"
git clone https://github.com/vic2019/puppeteer.git $repo 2>$null
cd $repo
npm install
npm install -g pm2

# Create 'puppeteer_dev_chrome_profile-XXXXXX' so that Chrome would run
mkdir C:\windows\system32\config\systemprofile\AppData\Local\Temp
echo "" > C:\windows\system32\config\systemprofile\AppData\Local\Temp\puppeteer_dev_chrome_profile-XXXXXX

# Run
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
pm2 start index.js
