Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Robbyrussell

Set-Alias ll ls

Set-Alias vim nvim

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
	Import-Module "$ChocolateyProfile"
}

