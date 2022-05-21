# uncomment to profile zsh
#zmodload zsh/zprof

zsh_prof() {
  env ZSH_PROF= zsh -ic zprof
}

zsh_time() {
  /usr/bin/time zsh -i -c exit
}

# keep duplicates out of the path by keeping only the first occurrances
export -U PATH="$PATH"

export LANG=en_US.UTF-8
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

path_size() {
  echo ${#${(s/:/)PATH}}
}

path_contains() {
  local query_path=$1
  local path_parts=(${(s/:/)PATH})
  for path_part in $path_parts; do
    if [[ "$path_part" == "$query_path" ]]; then
      return 0
    fi
  done
  return 1
}

try_sourcing() {
  for source_this in "$@"; do
    if [ -f "$source_this" ]; then
      source "$source_this"
    fi
  done
}

setup_env_cmd() {
  for env_cmd in "$@"; do
    if which "$env_cmd" &>/dev/null; then
      export PATH="$HOME/.$env_cmd/bin:$PATH"
      eval "$($env_cmd init -)"
    fi
  done
}

setup_env_cmd \
  scalaenv \
  sbtenv \
  jenv \
  rbenv \
  nodenv

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# History options
HISTSIZE=10000
SAVEHIST=10000
setopt append_history           # allow multiple sessions to append to one history
setopt bang_hist                # treat ! special during command expansion
setopt extended_history         # Write history in :start:elasped;command format
setopt hist_expire_dups_first   # expire duplicates first when trimming history
setopt hist_find_no_dups        # When searching history, don't repeat
setopt hist_ignore_dups         # ignore duplicate entries of previous events
setopt hist_ignore_space        # prefix command with a space to skip it's recording
setopt hist_reduce_blanks       # Remove extra blanks from each command added to history
setopt hist_verify              # Don't execute immediately upon history expansion
setopt inc_append_history       # Write to history file immediately, not when shell quits
setopt share_history            # Share history among all sessions

# Tab completion options 
autoload -Uz compinit && compinit
setopt complete_in_word         # cd /ho/sco/tm<TAB> expands to /home/scott/tmp
setopt auto_menu                # show completion menu on succesive tab presses
setopt autocd                   # cd to a folder just by typing it's name

# Misc options
setopt interactive_comments     # allow # comments in shell; good for copy/paste
unsetopt correct_all            # don't let zsh second-guess spelling
export BLOCK_SIZE="'1"          # Add commas to file sizes
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&' # These "eat" the auto prior space after a tab complete

# Fuzzy Finder base
export FZF_BASE="/usr/local/opt/fzf"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mine"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.zsh-custom"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(history-substring-search git timer fzf)

# This is disabled because handle_completion_insecurities() is hella slow
ZSH_DISABLE_COMPFIX=true

# Make history substring search use fuzzy matching
HISTORY_SUBSTRING_SEARCH_FUZZY=1

# load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# alias vim to nvim if installed
if type nvim > /dev/null; then
  alias vim=nvim
fi

ws() {
  workspace="$HOME/workspace/$1"
  if [ -d "$workspace" ]; then
    cd "$workspace"
    return 0
  else
    echo "Workspace not found at $workspace"
    return 1
  fi
}

# load personal env vars if present
try_sourcing "$HOME/.ssh/personal.env"

# add local bin if present
LOCAL_BIN="$HOME/local/bin"
if [ -d "$LOCAL_BIN" ]; then
  export PATH="$LOCAL_BIN:$PATH"
fi

# load local profile if present
try_sourcing "$HOME/local/.zshrc"

[ -f ~/.motd ] && cat ~/.motd
