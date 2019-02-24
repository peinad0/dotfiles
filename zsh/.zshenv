# Set the shell
export SHELL=$(which zsh)

# Default editor
export EDITOR='vim'

# SSH key
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
