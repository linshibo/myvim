export TERM=xterm-256color
export EDITOR="vim"
export LANG=en_US.UTF-8
ulimit -c 40000000
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxexexabagacad"

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p%{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}>'

function dec2ip() {
    local ip dec=$@
    for e in {3..0}
    do
        ((octet = dec / (256 ** e) ))
        ((dec -= octet * 256 ** e))
        ip+=$delim$octet
        delim=.
    done
    delim=""
    printf '%s  ' "$ip"
}

function clearPath() {
    export PATH=$(echo $PATH | awk -F: '{ for (i = 1; i <= NF; i++) {if(arr[$i]!=$i){printf "%s:",$i;arr[$i]=$i;}}printf "\n"}')
}

function ip2dec() {
    local a b c d ip=$@
    IFS=. read -r a b c d <<< "$ip"
    printf '%d\n' "$((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))"
}

function todate()
{
    if [ "`uname`" = "Darwin" ]; then
        date -r $1
    elif [ "`uname`" = "Linux" ]; then
        date -d @$1
        #date +"%F %T" -d "1970-01-01 UTC $1 seconds"
    fi
}

function tostamp()
{
    if [ "`uname`" = "Darwin" ]; then
        date -j -f "%Y-%m-%d %H:%M:%S" "$1" "+%s"
    elif [ "`uname`" ="Linux" ]; then
        date -d "$1" +%s
    fi
}

function dec(){ 
    printf "%d\n" $1; 
}

function hex(){ 
    printf "0x%08x\n" $1; 
}

source ~/workspace/myvim/bash_aliases

function alias_server()
{
    local idc=$1
    local lastip=`echo $2 | awk -F. '{print $4}'`
    alias go.$idc$lastip="ssh -p 20220 -i ~/.ssh/devops.pem devops@$2" 
    alias upload.$idc$lastip="upload_() { scp -P 20220 -i ~/.ssh/devops.pem -C -r \$1 devops@$2:~/; } && upload_ "
    alias download.$idc$lastip="download_() { scp -P 20220 -i ~/.ssh/devops.pem -C devops@$2:~/\"\$1\"; } && download_ "
}
