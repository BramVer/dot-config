# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/darm/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
export GPG_TTY=$(tty)


# CUSTOM SHITE

function addalias {
    echo "alias $1=\"$2\"" >> ~/.zshrc && source ~/.zshrc
}

function git-fetch-all-branches {
  for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done
}

function _list_changed_files {
  local -a files
  for f in `git ls-files -md`;
    do files[@]+=${f};
  done
  compadd -a files
}
function _git_diff_to_bat {
  {git diff $1; git diff --cached $1} | bat
}

function _list_venvs {
  local -a venvs
  for v in `ls ~/.virtualenvs | grep -e ".*_venv"`;
    do venvs[@]+=${v%*_venv};
  done
  compadd -a venvs
}
function _activate_venv {
  # Locked to python version 3.6.7
  if ! ls ~/.virtualenvs | grep -e "$1_venv" > /dev/null; then

    read "choice?Venv not found, create it? Y/n "
    case "$choice" in
      y|Y|"" ) echo "yes";;
      n|N|* ) return 1;;
    esac

    ~/.pyenv/shims/python3.6 -m venv ~/.virtualenvs/$1_venv

    if grep -e ".*ets" <<< "$2"; then
      cp ~/.virtualenvs/ets_config/pip.conf ~/.virtualenvs/$1_venv/
    fi
  fi

  source ~/.virtualenvs/$1_venv/bin/activate
  z $1
}
function _rm_venv {
  if ls ~/.virtualenvs | grep -e "$1_venv" > /dev/null; then

    read "choice?Confirm venv deletion Y/n "
    case "$choice" in
      y|Y|"" ) echo "yes";;
      n|N|* ) return 1;;
    esac
    rm ~/.virtualenvs/$1_venv -rf

  else
    echo "Could not find venv, exiting."
    return 1
  fi

  source ~/.zshrc
}
compdef _list_venvs _activate_venv;
compdef _list_venvs _rm_venv;
alias wo="_activate_venv"
alias rmvenv="_rm_venv"

compdef _list_changed_files _git_diff_to_bat;
alias baff="_git_diff_to_bat"

alias ls="exa"
alias resrc="source ~/.zshrc"
alias addalias="addalias"
alias lalias="grep -e 'alias [a-zA-Z_-]*=.*' ~/.zshrc | bat"
alias ff="firefox-developer-edition"

alias reset_db="~/.config/adimian/db_reload.sh"
