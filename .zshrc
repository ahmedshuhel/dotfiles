# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/snap/bin

export PATH=$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export J2SDKDIR=/usr/lib/jvm/java-11-openjdk-amd64/

export MODULAR_HOME=$HOME/.modular
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

export GOPATH=$HOME/Workspace
export PATH=$PATH:/usr/local/go/bin

# Add .NET Core SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"

if [[ $(pwd) == /mnt/c/Users/ahmedshuhel  ]]
then
    cd ~
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias zshconf="vim ~/.zshrc"
alias vimrc="vim ~/.config/nvim/init.lua"
alias vimdiff="vim -d"
alias ncd="nc-docker"

. "$HOME/.cargo/env"
