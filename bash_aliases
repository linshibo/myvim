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
alias psmem='ps -e -o "%C : %p : %z : %a"|sort -k5 -nr'
alias meminfo='free -m -l -t'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias pscpu='ps -e -o "%C : %p : %z : %a"|sort -nr'
alias cpuinfo='lscpu'
 
alias debugvi="vi -V9vimlog"

alias dstat="dstat -cdlmnpsy"
#alias translate="~/myvim/bin/gtrans en zh-cn"
alias vimrc="vi ~/.vim/comm.vim"
alias bashrc="vi ~/.bashrc"
alias vi='vim'

alias allusers="cut -d: -f1 /etc/passwd"
alias allgroups="cut -d: -f1 /etc/group"

#alias gm='git commit -a --allow-empty-message -m ""'
alias gm='git commit'
alias gp='git push origin $(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/") '
alias gl='git pull --rebase'
alias apt-get='sudo apt-get'
alias path='echo -e ${PATH//:/\\n}'
alias vi='vim'


#alias my='mysql -uroot -p123456 -A --prompt="\\u@\\h : \\d \\r:\\m:\\s>"'

alias autokey='sudo apt-get update 2> /tmp/keymissing; for key in $(grep "NO_PUBKEY" /tmp/keymissing |sed "s/.*NO_PUBKEY //"); do echo -e "\nProcessing key: $key"; gpg --keyserver pool.sks-keyservers.net --recv $key && gpg --export --armor $key | sudo apt-key add -; done'
