Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
$env:Path += ";C:\ProgramData\chocolatey\bin"

choco install -y git
$env:Path += ";C:\Program Files\Git\bin"

$dir = "C:\Users\app\repo"
git clone https://github.com/vic2019/puppeteer.git $dir 2>$null

choco install -y nodejs.install
$env:Path += ";C:\Program Files\nodejs"

cd $dir
npm install

npm install -g pm2

$env:temp = "C:\Users\app\AppData\Local\Temp"
$env:tmp = "C:\Users\app\AppData\Local\Temp"
Start-Process -FilePath "npm" -ArgumentList "start" -WorkingDirectory $dir -RedirectStandardOutput $dir\stdout.log -RedirectStandardError $dir\stderr.log

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
