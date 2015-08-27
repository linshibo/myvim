#enable color support of ls and also add handy aliases
unset color_prompt force_color_prompt
if [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export TERM=xterm-256color
export EDITOR="vim"
export LANG=en_US.UTF-8
ulimit -c 40000000
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxexexabagacad"

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p%{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}>'

#if [ -f ~/myvim/bash_func ]; then
    #. ~/myvim/bash_func
#fi

if [ -f ~/myvim/bash_aliases ]; then
    . ~/myvim/bash_aliases
fi
