# Setting $PATH
export PATH=$HOME/bin:/usr/local/bin:/snap/bin:$PATH

# Path to the oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH theme to display.
ZSH_THEME="ys"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History time stamps
HIST_STAMPS="yyyy-mm-dd"

# Oh-my-zsh plugins
plugins=( git docker cp zsh-syntax-highlighting pyenv)

# Spaceship settings
SPACESHIP_PROMPT_ORDER=( time user host dir git )
SPACESHIP_DOCKER_SHOW=false

# Sourcing oh-my-zsh and other shell helpers
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

# Sourcing needed files
source $HOME/.functions

# Autojump
source /usr/share/autojump/autojump.sh
