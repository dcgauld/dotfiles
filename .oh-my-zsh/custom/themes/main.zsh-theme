ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_PREFIX="⌥ %F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "

ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=") "

PROMPT='[%*] %B%F{cyan}%2~%f $(git_prompt_info)%b$(virtualenv_prompt_info)$ '
RPROMPT=''
