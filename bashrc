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
#PS1='\[\e[00;37m\][$LOCAL_IP_4 \[\e[00;32m\]\u\[\e[00;36m\]\[\e[00m\] \[\e[00;34m\]`pwd``B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/"); if [ "$B" != "" ]; then S="git"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S="hg"; elif [ -e .svn ]; then S="svn"; else S=""; fi; if [ "$S" != "" ]; then if [ "$B" != "" ]; then M=$S:$B; else M=$S; fi; fi; [[ "$M" != "" ]] && echo -n -e "\[\e[33;40m\]($M)\[\e[01;32m\]\[\e[00m\]"`\[\e[00;37m\]]\[\e[00;32m\]➜ \[\e[00m\]'
PS1='\[\e[00;37m\][\[\e[00;32m\]\u@\h\[\e[00;36m\]\[\e[00m\] \[\e[00;34m\]`pwd``B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/"); if [ "$B" != "" ]; then S="git"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S="hg"; elif [ -e .svn ]; then S="svn"; else S=""; fi; if [ "$S" != "" ]; then if [ "$B" != "" ]; then M=$S:$B; else M=$S; fi; fi; [[ "$M" != "" ]] && echo -n -e "\[\e[33;40m\]($M)\[\e[01;32m\]\[\e[00m\]"`\[\e[00;37m\]]\[\e[00;32m\]➜ \[\e[00m\]'
export TERM=xterm-256color
export EDITOR="vim"
export LANG=en_US.UTF-8
ulimit -c 40000000
export CLICOLOR=1

shopt -s extglob
shopt -s cdspell                # this will correct minor spelling errors in a cd command
shopt -s checkhash
shopt -s cmdhist                    # save multi-line commands in history as single line
shopt -s extglob				# necessary for bash completion (programmable completion)

if [[ -d ~/workspace/myvim/ ]]; then
  source ~/workspace/myvim/bash_aliases
  source ~/workspace/myvim/bash_func
fi

if [ -x /usr/bin/dircolors ]; then
  eval `dircolors ~/workspace/myvim/dircolors.256dark`
fi
#ssh-copy-id -i ~/.ssh/id_rsa.pub "-p 22000 francisco@10.1.1.20"

