# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="mh2"
#ZSH_THEME="mortalscumbag"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn docker)

# User configuration

# export PATH=$HOME/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.bash_aliases

# from mortalscumbat theme
function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  
  INDEX=$(git status --porcelain 2> /dev/null)
  PREFIX_STATUS=""
  SUFIX_STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    PREFIX_STATUS="$PREFIX_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  
  # branch behind?
  if $(echo "$(git log HEAD..origin/$(current_branch) 2> /dev/null)" | grep '^commit' &> /dev/null); then
    PREFIX_STATUS="$PREFIX_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi

  # is anything staged?
  if $(echo "$INDEX" | command grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    SUFIX_STATUS="$SUFIX_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | command grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    SUFIX_STATUS="$SUFIX_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    SUFIX_STATUS="$SUFIX_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | command grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    SUFIX_STATUS="$SUFIX_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $PREFIX_STATUS ]]; then
    PREFIX_STATUS="$PREFIX_STATUS "
  fi
  
  if [[ -n $SUFIX_STATUS ]]; then
    SUFIX_STATUS=" $SUFIX_STATUS"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$PREFIX_STATUS$(my_current_branch)$SUFIX_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  echo $(current_branch || echo "(no branch)")
}


local ret_status="%(?:%{$fg_bold[white]%}:%{$fg_bold[red]%}%s)"
PROMPT='%50<^<%{${ret_status}%}%~%<<%b%{$reset_color%}%(!.#.$) '
#RPROMPT='%{${ret_status}%}%D %T %b%n@%m%{$reset_color%}'
RPROMPT='$(my_git_prompt)'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}[%{$fg_no_bold[white]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
#ZSH_THEME_GIT_PROMPT_PREFIX=" $fg[white]‹ %{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}>%{$fg_no_bold[white]%}%B"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[yellow]%}<%{$fg_no_bold[white]%}%B"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}x"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}↑%{$fg_no_bold[white]%}%B"
#ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[yellow]%}↓%{$fg_no_bold[white]%}%B"
#ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}◾"
#ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}◾"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}◾"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
#ZSH_THEME_GIT_PROMPT_SUFFIX=" $fg_bold[white]›%{$reset_color%}"
