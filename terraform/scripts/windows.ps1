<powershell>
mkdir actions-runner; cd actions-runner
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.310.2/actions-runner-win-x64-2.310.2.zip -OutFile actions-runner-win-x64-2.310.2.zip
if((Get-FileHash -Path actions-runner-win-x64-2.310.2.zip -Algorithm SHA256).Hash.ToUpper() -ne 'cc4c9e357345a33bd99834daaf2e051730305e0a4e33e5a6b47d39e6a93844e4'.ToUpper()){ throw 'Computed checksum did not match' }
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.310.2.zip", "$PWD")
./config.cmd --url https://github.com/apinyarr/devops-doct-cicd --token AESNUZTRUVR6C3YED3WW663FFH7M2
./powershell .\svcinstall.ps1
./powershell Start-Service actions.runner.windows
</powershell>