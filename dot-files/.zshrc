# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/darm/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(
#  git
#  sudo
#  web-search
#  sublime
#)

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="subl3 ~/DEV/dot-config/dot-files/.zshrc"
alias ohmyzsh="subl3 ~/.oh-my-zsh"
alias dog="cat"
alias pacuar="pacaur"
alias dick="docker"
alias dickpiss="docker ps"
alias dickcunt='_dickcunt() { docker exec -it "$1" /bin/bash;}; _dickcunt'
alias dickpic='_dickpic() { docker ps | grep webapp_run | awk '{print $13}';}; _dickpic'
alias mppdk="_mppdk() {docker exec -it $(docker ps | grep webapp_run | awk '{print $11}') /bin/bash;}; _mppdk"

alias inuitsproxy='/usr/bin//sshuttle --dns -vvr chewbacca.internal.inuits.eu 0.0.0.0/0 -D --pidfile /tmp/inuits.pid'
alias inuitsproxy-stop='kill $( cat /tmp/inuits.pid )'

alias solr="/opt/solr/bin/solr"

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

alias custom-dots="cd ~/DEV/dot-config/dot-files/ && stt && git status"

alias lpa="cd ~/INUITS/LPA"
alias mumosad="cd ~/INUITS/LPA && source .virtualenvs/mumosa-default-venv/bin/activate && cd mundomosa-storm-main-topology && git status"

# MPP
alias mpp="cd ~/INUITS/MPP/ugent-mpp && git status"
alias converdfer="cd ~/INUITS/MPP/converdfer && python converdfer.py ../project_docs/mp3 500"
alias converd="cd ~/INUITS/MPP/converdfer && git status"
alias solr_proxy="ssh -v -NL 8080:localhost:8080 solr01.playground"

alias mon-right="xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1"
alias mon-top="xrandr --output eDP1 --auto --output HDMI1 --auto --above eDP1"

alias adcom='_addcomm() { git add "$1" && git commit -m "$2" ;}; _addcomm'

# COWSAY
# fortune iasip | cowsay -f tux


#############
## ANTIGEN ##
#############
source /usr/share/zsh/share/antigen.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle sudo
antigen bundle web-search
antigen bundle pip
antigen bundle command-not-found
antigen bundle sublime
antigen bundle zsh-autosuggestions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

eval $(thefuck --alias)
