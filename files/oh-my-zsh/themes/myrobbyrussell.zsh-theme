local ret_status="%B%(?:%{$fg_bold[green]%}[%m]➜ :%{$fg_bold[red]%}[%m]➜ )%b"
PROMPT='${ret_status} %B%{$fg[cyan]%}%~%{$reset_color%}%b $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
