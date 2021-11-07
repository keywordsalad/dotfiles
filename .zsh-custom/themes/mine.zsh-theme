PROMPT="%B%F{green}%n@%m%f:%F{cyan}%(5~|%-1~/.../%3~|%4~)%b%f
"
PROMPT+="%(?||[%B%F{red}%?%b%f] )"
PROMPT+="%B%(?|%F{green}|%F{red})>>>%f%b "
PROMPT+='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{blue}git:(%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue}) %F{yellow}x"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue})"

