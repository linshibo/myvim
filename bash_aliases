alias l='ls -allh'
alias l.='ls -d .* --color=tty'
alias ll='ls -lh --color=tty'
alias telnet="telnet -8 -e^e"
alias grep="grep --color=auto"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv'
alias rm="rm -i"
alias df="df -h"
alias du='du -h -c'
alias reload='source ~/.bashrc'
alias largest='du -cks * | sort -rn | head -n 10'
#alias largest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'
alias dir='ls  -d */'
alias bk="cd -" #回到上一目录
alias cp="cp -i -rf " 
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias tt="date +%s"
alias psmem="ps -e -o "%C : %p : %z : %a"|sort -k5 -nr"
alias pscpu="ps -e -o "%C : %p : %z : %a"|sort -nr"
 
alias debugvi="vi -V9vimlog"

alias dstat="dstat -cdlmnpsy"
#alias translate="~/myvim/bin/gtrans en zh-cn"
alias vimrc="vi ~/.vim/comm.vim"
alias bashrc="vi ~/.bashrc"

alias allusers="cut -d: -f1 /etc/passwd"
alias allgroups="cut -d: -f1 /etc/group"

#alias my='mysql -uroot -p123456 -A --prompt="\\u@\\h : \\d \\r:\\m:\\s>"'
