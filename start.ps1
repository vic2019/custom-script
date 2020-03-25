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
$env:Path += ";C:\windows\system32\config\systemprofile\AppData\Roaming\npm"


# Run
mkdir C:\windows\system32\config\systemprofile\AppData\Local\Temp
# Create 'puppeteer_dev_chrome_profile-XXXXXX' for Chromium to run
echo "" > C:\windows\system32\config\systemprofile\AppData\Local\Temp\puppeteer_dev_chrome_profile-XXXXXX
pm2 start index.js
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
