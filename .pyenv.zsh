if [[ `uname` == "Darwin" ]]; then
  export CFLAGS="-I$(brew --prefix openssl)/include"
  export LDFLAGS="-L$(brew --prefix openssl)/lib"
  export LDFLAGS="${LDFLAGS} -L$(brew --prefix zlib)/lib"
  export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix zlib)/include"
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix zlib)/lib/pkgconfig"
  export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix sqlite)/include"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

