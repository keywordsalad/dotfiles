PROMPT="%B%F{green}%n@%m%f:%F{cyan}%(5~|%-1~/…/%3~|%4~)%b%f
"
PROMPT+="%(?||[%B%F{red}%?%b%f] )"
PROMPT+="%B%(?|%F{green}|%F{red})➜%f%b "
PROMPT+='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{blue}git:(%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue}) %F{yellow}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue})"

function preexec() {
  cmd_timer=$(($(print -P %D{%s%6.}) / 1000))
}

function precmd() {
  if [ $cmd_timer ]; then
    local now=$(($(print -P %D{%s%6.}) / 1000))
    local d_ms=$(($now - $cmd_timer))
    local d_s=$((d_ms / 1000))
    local ms=$((d_ms % 1000))
    local s=$((d_s % 60))
    local m=$(((d_s / 60) % 60))
    local h=$((d_s / 3600))

    if   ((h > 0)); then cmd_elapsed=${h}h${m}m
    elif ((m > 0)); then cmd_elapsed=${m}m${s}s
    elif ((s > 9)); then cmd_elapsed=${s}.$(printf %03d $ms | cut -c1-2)s # 12.34s
    elif ((s > 0)); then cmd_elapsed=${s}.$(printf %03d $ms)s # 1.234s
    else cmd_elapsed=${ms}ms
    fi

    unset cmd_timer
  else
    # Clear previous result when hitting Return with no command to execute
    unset cmd_elapsed
  fi
}

RPROMPT='%F{gray}$cmd_elapsed%f'

