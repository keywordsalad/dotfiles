# uncomment to profile zsh
#zmodload zsh/zprof

zsh_prof() {
  env ZSH_PROF= zsh -ic zprof
}

zsh_time() {
  /usr/bin/time zsh -i -c exit
}

export LANG=en_US.UTF-8
export EDITOR=vim

prepend_path() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH="$1:$PATH"
  fi
}

prepend_path "/usr/local/sbin"
prepend_path "$HOME/.local/bin"
prepend_path "$HOME/.cargo/bin"
prepend_path "$HOME/bin"
prepend_path "$HOME/.dotfiles/bin"

# General ZSH options
setopt HIST_FIND_NO_DUPS

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
plugins=(history-substring-search git)

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

if ! type "sbtenv" > /dev/null; then
  prepend_path "$HOME/.sbtenv/bin"
  eval "$(sbtenv init -)"
fi

if ! type "scalaenv" > /dev/null; then
  prepend_path "$HOME/.scalaenv/bin"
  eval "$(scalaenv init -)"
fi

# load local profile if present
local local_profile="$HOME/local/.zshrc"
if [ -f "$local_profile" ]; then
  source "$local_profile"
fi
unset local_profile

