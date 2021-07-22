export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Stack to $PATH
export PATH=$PATH:~/.bin/

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

# Homebrew ZSH completition
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

autoload -U compinit
compinit

fpath=($fpath ~/.zsh/completion)
[ -f "/Users/lewis/.ghcup/env" ] && source "/Users/lewis/.ghcup/env" # ghcup-env

## Nvm upgrade function

function nvm_upgrade() {
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    \. "$NVM_DIR/nvm.sh"
    cd $HOME
}

eval "$(pyenv init -)"

# dotnet sdk
export PATH=$PATH:/usr/local/share/dotnet

# ZSH git prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT="%n@mac %1~ %F{red}(\$vcs_info_msg_0_)%f %# "
zstyle ':vcs_info:git:*' formats '%b'
