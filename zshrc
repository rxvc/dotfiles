# Load tmux at the beginning (must be before p10k instant prompt)
if [[ -z "$TMUX" && -n "$PS1" && $- == *i* ]]; then
    tmux new-session -A -s main
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ${ZDOTDIR:-~}/.zshrc

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory (Homebrew on Apple Silicon).
fpath=(/opt/homebrew/share/antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
zstyle ':omz:alpha:lib:git' async-prompt no
source ${zsh_plugins}.zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf keybindings and completions (brew install fzf)
source <(fzf --zsh)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt INC_APPEND_HISTORY     # Write to HISTFILE immediately
setopt SHARE_HISTORY          # Share history across sessions
setopt HIST_IGNORE_DUPS       # Skip consecutive duplicate entries
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate entries
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming
setopt HIST_FIND_NO_DUPS      # Skip duplicates in history search
setopt HIST_REDUCE_BLANKS     # Remove extra whitespace

# Terminal Color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Lazy NVM — loads on first use of nvm, node, npm, npx
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unfunction nvm node npm npx 2>/dev/null
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }

# Aliases

# Git
alias gp='git pull'
alias gpr='git pull --rebase'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias ga='git add'
alias gst='git status'
alias gpu='git push'
alias glog='git log'
alias gshow='git show'
alias glogs='git log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'
alias multipull="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"
alias gitpull="find . -maxdepth 3 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} pull"

# Kubectl
alias k='kubectl'
alias kcv='kubectl config view'
alias kcc='kubectl config use-context'

# direnv (brew install direnv)
eval "$(direnv hook zsh)"
