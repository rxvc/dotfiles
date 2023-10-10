export TERM='xterm-256color'
#https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions#option-4-install-nerd-fonts
#https://github.com/Powerlevel9k/powerlevel9k/wiki/Show-Off-Your-Config
#https://github.com/sevenfoxes/dotfiles/
#https://github.com/ryanoasis/nerd-fonts
#https://github.com/zsh-users/antigen
source /opt/homebrew/share/antigen/antigen.zsh
source ~/.dotfiles/.theme
antigen use oh-my-zsh
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

export TERM='xterm-256color'
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

setopt histignorealldups share_history prompt_subst
unsetopt auto_name_dirs
autoload -Uz compinit
fpath+=~/.zfunc
compinit
bindkey -e

# Allow Ctrl-s in vim
stty -ixon

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
#Prompt color and model
PROMPT="%F{240}\$(repeat \$COLUMNS printf '·')%f"
PROMPT+='%B%F{green}%n%F{green}:%F{blue}%(3~|…|)%2~%F{green} *-> %b%f'

unsetopt auto_name_dirs

#Alias to start emacs in terminal window
#alias emacs='emacs -nw'

#Java export /Library/Java/JavaVirtualMachines/
export JAVA_HOME=${SDKMAN_CANDIDATES_DIR}/java/${CURRENT}
export PATH=$JAVA_HOME/bin:$PATH

#Terminal Color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'


#Node Version Manager installed with brew install nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Load tmux at the beginning
if [ "$TMUX" = "" ]; then tmux; fi

#Go
#export GOPATH=$HOME/go
#export GOROOT=/opt/homebrew/bin/
#export PATH=$PATH:$GOROOT/bin
export GOBIN=$GOPATH/bin/
export GOPROXY=https://goproxy.io,direct
export GOSUMDB="sum.golang.org"
export GOSUMDB="gosum.io+ce6e7565+AY5qEHUk/qmHc5btzW45JVoENfazw8LielDsaI+lEbq6"
export GO111MODULE=on

#Aliases

#Git
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
#Kubectl alias
alias k='kubectl'
alias kcv='kubectl config view'
alias kcc='kubectl config use-context'

#direnv configuration - install brew direnv
eval "$(direnv hook zsh)"

#brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#python
#if [ usr/local/bin/python3 ];
#then
#  alias python='python3'
#  alias pip='pip3'
#fi

#Alias for open mac vim outside terminal
#alias mvim="open -a MacVim.app $1"
alias mvim="/Applications/MacVim.app/Contents/bin/mvim $1"

#brew install fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#kubectl autocomplate
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
complete -F __start_kubectl k

#Temporal Kubeconfig
#export KUBECONFIG=/Users/rvallejo/.kube/config:/Users/rvallejo/.kube/config.sandbox:/Users/rvallejo/.kube/config.qa:/Users/rvallejo/.kube/config.preview:/Users/rvallejo/.kube/config.mapi:/Users/rvallejo/.kube/config.nonprod

#https://krew.sigs.k8s.io/docs/user-guide/setup/install/
export PATH="${PATH}:${HOME}/.krew/bin"

#alias svim='vim -u ~/.SpaceVim/vimrc'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#sudo gem install colorls
alias ll='colorls -lA --sd --gs --group-directories-first'
alias ls='colorls --group-directories-first'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/completion.zsh.inc'; fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

#1Password Autocomplete
eval "$(op completion zsh)"; compdef _op op

# Load Angular CLI autocompletion.
#source <(ng completion script)


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


alias kubectl="kubecolor"

# GPG TTY for GPG
export GPG_TTY=$(tty)
