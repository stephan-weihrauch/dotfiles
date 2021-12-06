###########################################
########         zsh conf         #########
###########################################

# Path to your oh-my-zsh installation.
export ZSH="/Users/stephan.weihrauch/.oh-my-zsh"
# zsh theme: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER=stephan.weihrauch
# RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

#Plugins 

plugins=(
  git
  terraform
  git
  macos
  gitignore
  kubectl
  docker
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
  colorize
  colored-man-pages
)

# Open tmux on startup, requires tmux plugin
ZSH_TMUX_AUTOSTART=true

# oh-my-zsh.sh sources all the *.zsh files in $ZSH_CUSTOM/custom
# - I include: aliases.zsh, functions.zsh, prompt.zsh, ect.
source $ZSH/oh-my-zsh.sh
#source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh # ZSH plugins installiert via brew

## oh-my-zsh settings #################################################################
# zstyle ':omz:update' mode auto      # update automatically without asking 
# ENABLE_CORRECTION="true"  # Uncomment the following line to enable command auto-correction.

# ## Alias ######################################################################
# alias vim="nvim"
# alias v="nvim"
# alias src="source ~/.zshrc" 

# ## Configs
# alias vimconfig="vim ~/.config/nvim/init.vim"
# alias zshconfig="vim ~/.zshrc"
# alias srczsh="source ~/.zshrc"
# alias fishconfig="vim ~/.config/fish/config.fish"
# alias ohmyzsh="vim ~/.oh-my-zsh"

# ## Mac 
# alias sleep="pmset sleepnow"
# alias lock="pmset displaysleepnow"

# ## Docker / Podman
# alias rm-container="podman rm -fv $(docker ps -a -q)"
# alias rm-images="podman rmi $(docker images -q)"

# start the ssh-agent #################################################################
SSH_ENV=$HOME/.ssh/environment

function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

## java stuff #################################################################
export JAVA_HOME=$(/usr/libexec/java_home)

## groovy stuff #################################################################
export GROOVY_HOME=$(brew --prefix)/opt/groovy/libexec

## Docker stuff #################################################################
export DOCKER_HOST="ssh://ubuntu@docker.local"
reset # clean two docker errors at start

#time source ~/.zshrc #to track time to restart zshrc

# prompt.zsh augments agnoster prompt, removes user@hostname
# needs to be run at end of .zshrc
prompt_context() 

## start with fish ###################################################### 
#fish

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

