# Add Homebrew bin paths to PATH (macOS)
$ENV:PATH = "/opt/homebrew/bin:/usr/local/bin:$ENV:PATH"

Invoke-Expression (&starship init powershell)

Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'

Import-Module PSFzf

Set-Alias ll ls
Set-Alias vim nvim

Set-Alias ll ls
Set-Alias vim nvim