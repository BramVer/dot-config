# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/bram/.oh-my-zsh"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
#
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"


 plugins=(
    git
    python
    pep8
    pylint
    git-extras
    tig
    sudo
    history
    dirhistory
    django
    docker
    z
 )

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
fpath+=~/.zfunc
# export PYTHONSTARTUP="/home/bram/.config/python_repl_startup.py"
# export PYTHONWARNINGS="ignore::yaml.YAMLLoadWarning"

export CHEAT_COLORS=true
export NPM_CONFIG_PREFIX="~/.config/npm-global"

# Adimian
export WORKON_HOME=~/.virtualenvs
export BETTER_EXCEPTIONS=1
export PYENV_ROOT="$HOME/.pyenv"
export VIRTUALENVWRAPPER_PYTHON="$HOME/.pyenv/versions/3.6.7/bin/python"
export PATH="$PYENV_ROOT/bin:$PATH:$HOME/adimian/greenpandas"
export B2E2_CONFIG="$HOME/.config/adimian/b2e2_settings.py"
export GREENPANDAS_CONFIG="$HOME/.config/adimian/greenpandas_settings.py"
export SAFIRES_CONFIG="$HOME/.config/adimian/safires_conf.yaml"
export ANSIBLE_VAULT_PASSWORD_FILE=~/.config/adimian/vault
export PIP_REQUIRE_VIRTUALENV=true

export GPG_TTY=$(tty)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval
  fuck () {
      TF_PYTHONIOENCODING=$PYTHONIOENCODING;
      export TF_SHELL=zsh;
      export TF_ALIAS=fuck;
      TF_SHELL_ALIASES=$(alias);
      export TF_SHELL_ALIASES;
      TF_HISTORY="$(fc -ln -10)";
      export TF_HISTORY;
      export PYTHONIOENCODING=utf-8;
      TF_CMD=$(
          thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
      ) && eval $TF_CMD;
      unset TF_HISTORY;
      export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
      test -n "$TF_CMD" && print -s $TF_CMD
  }

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

      ~/.virtualenvs/$1_venv/bin/pip install --user bpython pdbpp better_exceptions
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
function _beat {
  cheat $1 | bat -l md
}

function _grep_ansv {
  echo "Starting search..."[
    for i in `ls "$(pwd)/$1" | grep -e ".*\.yml"`; do
    file="$(pwd)/$1/$i";
    match=$(ansvv "$file" | grep "$2")

    [[ $match ]] && {
      echo "---"
      echo "File: $file";
      echo $match;
      echo "---"
    }
  done

  echo "Done"
}

function _gpip {
  PIP_REQUIRE_VIRTUALENV=""
  pip -u "$@"
}

function _mytest {
  python -m pytest $1 -l -vW $2
}

compdef _list_venvs _activate_venv;
compdef _list_venvs _rm_venv;
alias wo="_activate_venv"
alias rmvenv="_rm_venv"

compdef _list_changed_files _git_diff_to_bat;
alias baff="_git_diff_to_bat"

alias beat="_beat"

alias ls="exa"
alias resrc="source ~/.zshrc"
alias addalias="addalias"
alias lalias="grep -e 'alias [a-zA-Z_-]*=.*' ~/.zshrc | bat"
alias ff="firefox-developer-edition"

alias reset_db="~/.config/adimian/db_reload.sh"

alias ansve="ansible-vault edit"
alias ansvv="ansible-vault view"


alias gransv="_grep_ansv"
alias gatsby="~/.config/npm-global/bin/gatsby"

alias gpip="_gpip"

alias mytest="_mytest"
