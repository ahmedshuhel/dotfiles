## Run autossh script as servcie

```bash

❯ cd ~/Library/LaunchAgents
❯ ln -s ~/Workspace/dotfiles/com.ahmed.shuhel.autosshdevenv.plist

# Load; the -w flag makes the change persistent across reboots for enabled jobs.
❯ launchctl load -w com.ahmed.shuhel.autosshdevenv.plist


# Tail logs
❯ tail -f ~/Library/Logs/com.shuhel.autosshdevenv.out.log
❯ tail -f ~/Library/Logs/com.shuhel.autosshdevenv.err.log

# Unload
❯ launchctl unload -w com.ahmed.shuhel.autosshdevenv.plist


# Note: since KeepAlive is true, launchctl stop might only temporarily stop it, and launchd could restart it.

❯ launchctl start com.shuhel.autosshdevenv  # To manually start (if not already running via KeepAlive)
❯ launchctl stop com.shuhel.autosshdevenv   # To manually stop

```
