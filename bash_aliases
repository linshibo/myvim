alias vi='vim'

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

alias largest='du -cks * | sort -rn | head -n 10'
alias dir='ls  -d */'
alias bk="cd -" #回到上一目录
alias cp="cp -i -rf " 

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias cd..="cd .."
alias cd...="cd ../../"
alias cd....="cd ../../../"
alias cd.....="cd ../../../../"
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias psmem='ps -e -o "%C : %p : %z : %a"|sort -k5 -nr'
alias pscpu='ps -e -o "%C : %p : %z : %a"|sort -nr'
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'

alias nowts="date +%s"
alias nowdate='date +"%Y-%m-%d %T"'

alias dstat="dstat -cdlmnpsy"

alias debugvi="vi -V9vimlog"

alias allusers="cut -d: -f1 /etc/passwd"
alias allgroups="cut -d: -f1 /etc/group"

alias gm='git commit'
alias gp='git push origin $(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/") '
alias gl='git pull'
alias glr='git pull --rebase'
alias gtr='git log --graph --oneline --all'
alias path='echo -e ${PATH//:/\\n}'

#alias my='mysql -uroot -p123456 -A --prompt="\\u@\\h : \\d \\r:\\m:\\s>"'

alias autokey='sudo apt-get update 2> /tmp/keymissing; for key in $(grep "NO_PUBKEY" /tmp/keymissing |sed "s/.*NO_PUBKEY //"); do echo -e "\nProcessing key: $key"; gpg --keyserver pool.sks-keyservers.net --recv $key && gpg --export --armor $key | sudo apt-key add -; done'

alias goto='go_() { ssh -p 20220 -i ~/.ssh/devops.pem devops@$1; } && go_ ' 
alias upload='upload_() { scp -P 20220 -i ~/.ssh/devops.pem -C -r "$2" devops@$1:~/; } && upload_ '
alias download='download_() { scp -P 20220 -i ~/.ssh/devops.pem -C devops@$1:~/"$2" . ; } && download_ '
