#colors
BLK="\e[00;30m"
RED="\e[00;31m"
GRN="\e[00;32m"
YEL="\e[00;33m"
BLU="\e[00;34m"
MAG="\e[00;35m"
CYN="\e[00;36m"
WHI="\e[00;37m"
LightRED="\e[00;91m"
LightGRN="\e[00;92m"
LightYEL="\e[00;93m"
LightBLU="\e[00;94m"
LightMAG="\e[00;95m"
LightCYN="\e[00;96m"
LightWHI="\e[00;97m"
EndCOLOR="\e[00m"


set -o notify
PS1="[${LightGRN}\u@\h ${LightCYN}`pwd``B=$(git branch 2>/dev/null | sed -e \"/^ /d\" -e \"s/* \(.*\)/\1/\"); if [ \"$B\" != \"\" ]; then S=\"git\"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S=\"hg\"; elif [ -e .svn ]; then S=\"svn\"; else S=\"\"; fi; if [ \"$S\" != \"\" ]; then if [ \"$B\" != \"\" ]; then M=$S:$B; else M=$S; fi; fi; [[ \"$M\" != \"\" ]] && echo -n -e \"${LightYEL}($M)${EndCOLOR}\"`]${GRN}➜${EndCOLOR}"
export TERM=xterm-256color
export EDITOR="vim"
export LANG=en_US.UTF-8
export CLICOLOR=1

shopt -s extglob
shopt -s cdspell                # this will correct minor spelling errors in a cd command
shopt -s checkhash
shopt -s checkwinsize               # update windows size on command
shopt -s cmdhist                    # save multi-line commands in history as single line
shopt -s extglob				# necessary for bash completion (programmable completion)


source ~/myvim/bash_aliases

source ~/myvim/bash_func

eval `dircolors ~/myvim/dircolors.256dark`

#ssh-copy-id -i ~/.ssh/id_rsa.pub "-p 22000 francisco@10.1.1.20"
