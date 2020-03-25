$env:Path += ";C:\ProgramData\chocolatey\bin"
$env:Path += ";C:\Program Files\Git\bin"
$env:Path += ";C:\Program Files\nodejs"
$dir = "C:\Users\app\repo"

Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
choco install -y git
choco install -y nodejs.install

$env:temp = "C:\Users\app\AppData\Local\Temp"
$env:tmp = "C:\Users\app\AppData\Local\Temp"



git clone https://github.com/vic2019/puppeteer.git $dir 2>$null

cd $dir
npm install

npm install -g pm2

Start-Process -FilePath "npm" -ArgumentList "start" -WorkingDirectory $dir -RedirectStandardOutput $dir\stdout.log -RedirectStandardError $dir\stderr.log

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
