# Windows

```powershell
choco install gsudo

sudo New-Item -ItemType SymbolicLink -Name settings.json -Path C:\Users\<user>\AppData\Local\Packages\Microsoft.WindowsTerminal_<random>\LocalState -Target C:\Users\ahmedshuhel\Workspace\dotfiles\Windows_Terminal.Settings.json

sudo New-Item -ItemType SymbolicLink  -Name .vsvimrc -Path C:\Users\ahmedshuhel\  -Target C:\Users\ahmedshuhel\Workspace\dotfiles\.vsvimrc

sudo New-Item -ItemType SymbolicLink  -Name .gitconfig -Path C:\Users\ahmedshuhel\  -Target C:\Users\ahmedshuhel\Workspace\dotfiles\.gitconfig

# Neovim

mkdir C:\Users\ahmedshuhel\AppData\Local\nvim\ 

sudo New-Item -ItemType SymbolicLink -Name init.vim -Path C:\Users\ahmedshuhel\AppData\Local\nvim\  -Target C:\Users\ahmedshuhel\Workspace\dotfiles\.winvimrc
```
