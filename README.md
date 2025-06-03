# My `.` files

## Installation

This repository uses [Dotbot](https://github.com/anishathalye/dotbot) for managing dotfiles.

### Quick Setup (Basic)

```bash
git clone https://github.com/yourusername/dotfiles.git ~/Workspace/dotfiles
cd ~/Workspace/dotfiles
./install
```

### Setup with LaunchAgent (for development machines)

If you need the autossh LaunchAgent service (for tunneling to development environments):

```bash
cd ~/Workspace/dotfiles
./install-with-launchd
```

### What gets installed

**Basic installation:**

- **Git configuration** → `~/.gitconfig` and `~/.gitignore_global`
- **Zsh configuration** → `~/.zshrc`
- **Neovim configuration** → `~/.config/nvim/`
- **Starship prompt** → `~/.config/starship.toml`
- **Shell scripts** → `~/bin/` (accessible as commands)
- **Color schemes** → `~/.config/colorschemes/`
- **PowerShell profile** → `~/.config/powershell/` (if PowerShell installed)

**With LaunchAgent:**

- All of the above, plus:
- **AutoSSH service** → `~/Library/LaunchAgents/` (configurable)

### LaunchAgent Management

Use the `launchd-manager` script to control the autossh service:

```bash
# Install the service
./launchd-manager install

# Start the service
./launchd-manager load

# Check service status
./launchd-manager status

# View service logs
./launchd-manager logs

# Stop the service
./launchd-manager unload

# Restart the service
./launchd-manager reload
```

### Usage

```bash
# Install/update dotfiles (basic)
./install

# Install with LaunchAgent
./install-with-launchd

# Install with verbose output
./install -v

# Only run specific sections
./install --only link
./install --only shell
```

### Adding new dotfiles

1. Add your files to this repository
2. Update `install.conf.yaml` to include the new symlinks
3. Run `./install` to apply changes

## Powershell Profile

### Profile Path

```powershell
echo $PROFILE
```

### Install Modules

```powershell
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
```
