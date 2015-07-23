# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# HISTCONTROL来消除命令历史中的连续重复条目
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000
export HISTTIMEFORMAT="%F %T:"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color)color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [[ $(type -P brew) ]]; then
    [[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
    [[ -f `brew --prefix`/etc/autojump.bash ]] && source `brew --prefix`/etc/autojump.bash
fi

if [ "`uname`" == "Darwin" ]; then
    localip=`/sbin/ifconfig en1 2>/dev/null | awk '$1=="inet"{print $2}'`
elif [ "`uname`" == "Linux" ]; then
    localip=`/sbin/ifconfig eth0 2>/dev/null | awk '$1=="inet"{print $2}' | awk -F: '{print $2}' `
fi

#colors
BLK='\e[00;30m'
RED='\e[00;31m'
GRN='\e[00;32m'
YEL='\e[00;33m'
BLU='\e[00;34m'
MAG='\e[00;35m'
CYN='\e[00;36m'
WHI='\e[00;37m'
RES='\e[00m'

set -o notify

export LOCAL_IP=$localip
export LOCAL_IP_4=`echo $localip | awk -F. '{print $4}' `
PS1='\[\e[00;37m\][$LOCAL_IP_4 \[\e[00;32m\]\u\[\e[00;36m\]\[\e[00m\] \[\e[00;34m\]`pwd``B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/"); if [ "$B" != "" ]; then S="git"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S="hg"; elif [ -e .svn ]; then S="svn"; else S=""; fi; if [ "$S" != "" ]; then if [ "$B" != "" ]; then M=$S:$B; else M=$S; fi; fi; [[ "$M" != "" ]] && echo -n -e "\[\e[33;40m\]($M)\[\e[01;32m\]\[\e[00m\]"`\[\e[00;37m\]]\[\e[00;32m\]➜ \[\e[00m\]'
export TERM=xterm-256color
export EDITOR="vim"
export LANG=en_US.UTF-8
ulimit -c 40000000
#export PATH=$PATH:.
export CLICOLOR=1

shopt -s extglob
shopt -s cdspell                # this will correct minor spelling errors in a cd command
shopt -s checkhash
shopt -s checkwinsize               # update windows size on command
shopt -s cmdhist                    # save multi-line commands in history as single line
shopt -s extglob				# necessary for bash completion (programmable completion)


if [ -f ~/myvim/bash_func ]; then
    . ~/myvim/bash_func
fi

# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh

complete -F _killall killall killps

complete -F _make -X '+($*|*.[cho])' make gmake pmake\

complete -o default -F _meta_comp nohup \
eval exec trace truss strace sotruss gdb
complete -o default -F _meta_comp command type which man nice time

complete -o default -F _meta_comp nohup \
eval exec trace truss strace sotruss gdb
complete -o default -F _meta_comp command type which man nice time
complete -F _tar -o default tar
complete  -o default -F _longopts configure bash
complete  -o default -F _longopts wget id info a2ps ls recode


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/myvim/bash_aliases ]; then
    . ~/myvim/bash_aliases
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#example alias_comm_cmd 24 '' francisco 10.1.1  22000 pb07210339 

#ssh-copy-id -i ~/.ssh/id_rsa.pub "-p 22000 francisco@10.1.1.20"

