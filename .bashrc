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

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi
#export WORKDIR=$HOME/DB
#alias viproto='vim -p f Croute_func.cpp Croute_func.h $WORKDIR/include/proto.h'
# some more ls aliases


ulimit -c 40000000
export PATH=$PATH:.
alias c79=' sshpass -p"xcwen142857" ssh -2 -p56000 db@192.168.4.79'

alias l='ls -allh'
alias l.='ls -d .* --color=tty'
alias lf='ls'
alias ll='ls -lh --color=tty'
alias ls='ls --color=tty'
alias vi="vim"
alias telnet="telnet -8 -e^e"
alias grep="grep --color=auto"
alias rm="rm -i"
alias df="df -h"
alias dir='ls  -d */'
#alias cdd='cd $HOME/桌面'

alias cdsrc='cd ../src'
alias cdbin='cd ../bin'
alias cdlog='cd ../log'
alias cdetc='cd ../etc'

alias cdol='cd ~/online/src'
alias cddb='cd ~/db/src'
alias cdhome='cd ~/home/src'
alias cdsw='cd ~/switch/src'
alias cdbt='cd ~/batlserv/src'
alias cdlg='cd ~/login'
alias cdpx='cd ~/dbproxy'

#export WORKDIR=$HOME/DB/trunk
#alias cdw='cd $WORKDIR'

alias sub="ls -d */" #只显示文件夹
alias bk="cd -" #回到上一目录
alias cp="cp -i -rf " 
alias rmlog="rm -rf ../log/* " 
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias getdate='~/bin/./getdate.sh'

#export PATH=.:$PATH:~/DB/bin:~/bin

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
#设置vi模式
set -o vi

localip=`/sbin/ifconfig eth0 | awk '$1=="inet"{print $2}' | awk -F: '{print $2}'`
export LOCAL_IP=$localip
export LOCAL_IP_4=`echo $localip | awk -F. '{print $4}' `
export LOCAL_IP_3=`echo $localip | awk -F. '{print $3}' `
export PS1="==[$LOCAL_IP_4]==\u@\h:\w\$"
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|linux)
    PROMPT_COMMAND='echo -ne "\033]0; $LOCAL_IP_3.${LOCAL_IP_4}franc\007"'
    ;;
*)
    ;;
esac

export EDITOR="vim"
export LANG=en_US.UTF-8

#alias my='mysql -udbuser -pdbpass_rew'
alias my='mysql -uroot -proot -A'
declare -x LANG="en_US.UTF-8"
alias c46jim="sshpass -pxcwen142857 ssh jim@10.1.1.46"
alias c5="sshpass  -pxcwen142857 ssh -p22000 su@10.1.1.5"
alias c7="sshpass -pxcwenxcwen ssh -p22000 jim@10.1.1.7"
alias c154="sshpass -pxcwen142857 ssh -p22000 jim@10.1.1.154"
alias msginfo="./msginfo -d bin.log"
alias dstat="dstat -cdlmnpsy"

#绑定bash快捷键 绑定的函数见man readline
#清屏
bind -m vi-insert '\c-l':clear-screen
#向前 向后搜索历史
bind -m vi-insert '\c-p':history-search-forward
bind -m vi-insert '\c-n':history-search-backward
#跳到末尾
bind -m vi-insert '\c-e':end-of-line
#跳到开头
bind -m vi-insert '\c-a':beginning-of-line
#向后一个字符
bind -m vi-insert '\c-b':backward-char
#向前一个字符
bind -m vi-insert '\c-f':forward-char
#向前del一个字符
bind -m vi-insert '\c-d':forward-delete-char
bind -m vi-insert '\c-x':exchange-point-and-mark
bind -m vi-insert '\c-u':unix-line-discard
bind -m vi-insert '\c-w':unix-word-rubout
bind -m vi-insert '\c-k':kill-line
