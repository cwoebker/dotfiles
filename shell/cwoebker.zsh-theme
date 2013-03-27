local time='%{$fg_bold[white]%}%T |'
local user='%{$fg_bold[yellow]%}%n'
local pwd='%{$fg[cyan]%}%~'
local prompt='%{$fg_bold[red]%}➜ '

# PYTHON INFO
PYTHON_VER=`python -c 'import sys; print(sys.version[:5])'`
local python_info='%{$fg_bold[yellow]%}<py-${PYTHON_VER}$PYTHON_ENV_EXT%{$fg_bold[yellow]%}>'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

#ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%} ✚"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✹"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[yellow]%} ✖"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[yellow]%} ➜"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} ✭"
#$(git_prompt_status)

PROMPT="${time} ${user} ${pwd} ${prompt} % %{$reset_color%}"

#${python_info}
RPROMPT="$(git_prompt_info) !%{$fg_bold[cyan]%}%h%{$reset_color%}"
