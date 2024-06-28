$ENV:STARSHIP_CONFIG = "$HOME\Workspace\dotfiles\starship.toml"

Invoke-Expression (&starship init powershell)

Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'

Import-Module PSFzf

Set-Alias ll ls
Set-Alias vim nvim

Set-Alias ll ls
Set-Alias vim nvim

