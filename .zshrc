eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

export PATH=$PATH:$HOME/bin

if [[ $(pwd) == /mnt/c/Users/ahmedshuhel  ]]
then
    cd ~
fi

alias zshconf="vim ~/.zshrc"
alias vimrc="vim ~/.config/nvim/init.lua"
alias vimdiff="vim -d"
alias ncd="nc-docker"

. "$HOME/.local/bin/env"