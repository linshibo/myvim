# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/Users/frank/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/go/bin:.:/Users/frank/work/bin/:/Users/frank/work/bin/:.:.:.:.:.:.:.:."
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#关于历史纪录的配置
# number of lines kept in history
export HISTSIZE=10000
# # number of lines saved in the history after logout
export SAVEHIST=10000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY
#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)

export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'


declare -x GOPATH="/Users/frank/work"

alias c240="ssh frank@42.62.67.240"

if [ -f ~/myvim/_bash_aliases ]; then
    . ~/myvim/_bash_aliases
fi


# {{{ Watch logins
## Watch for logins and logouts from all accounts including mine.
watch=all
## Watch every 30 seconds
logcheck=30
## Change the watch format to something more informative
# %n = username, %M = hostname, %a = action, %l = tty, %T = time,
# %W = date
WATCHFMT="%n from %M has %a tty%l at %T %W"
# }}}

# {{{ General setopts
## Don't clobber files by default.  Force myself to use &gt;! or &gt;| and &gt;&gt;! or &gt;&gt;|
## to clobber the file
unsetopt clobber

## I use dvorak, so correct spelling mistakes that a dvorak user would make
setopt dvorak

## Extended history.
## Instead of just a list of commands, append it with this:
## `:&lt;beginning time since epoch&gt;:&lt;elapsed seconds&gt;:&lt;command&gt;'.
setopt extended_history

## Automatically append directories to the push/pop list
setopt auto_pushd

## Maximum size of the directory stack
DIRSTACKSIZE=50
# }}}

# set options
setopt    append_history               # don't overwrite history
setopt    extended_history             # [unset] 
setopt    hist_find_no_dups            # [unset] ignore dupes in history search
setopt    hist_ignore_dups             # this will not put _consecutive_ duplicates in the history
setopt    hist_ignore_space            # if any command starts with a whitespace, it will not be saved. it will stil be displayed in the current session, though
setopt    hist_verify                  # [unset] when doing history substitution, put the substituted line into the line editor
# perhaps we want to change HISTCONTROL=ignoredups ?

setopt    auto_remove_slash            # [unset] If a completion ends with a slash and you type another slash, remove one of them
setopt    bg_nice                      # [set -6] Renice background jobs
#setopt    cdablevars
setopt    auto_param_slash             # [set] append a slash if completion target was a directory
setopt    auto_cd                      # [unset] enables you to omit 'cd' before a path
setopt    correct_all                  # Try to autocorrect commands & file names
setopt    hash_list_all                # [set] always make sure that the entire command path is hashed
setopt    short_loops                  # [unset] 'for i in *; echo $i;' instead of 'for i in *; do echo $i; done'
#setopt globdots                # with this, we could treat dotfiles the same as normal ones

setopt    interactive_comments         # with this, we can do 'some_evil_stuff # which we explain' and just execute some_evil_stuff
setopt    list_packed                  # [unset] show compact completion list
setopt    long_list_jobs               # [unset] show job number & PID when suspending
setopt no_clobber                      # this will probihbit 'cat foo > bar' if bar exists. use >! instead
setopt    extended_glob                # enables various things, most notably ^negation. '^', '#' and forgotwhich :/ see cheatsheet & http://zsh.dotsrc.org/Intro/intro_2.html#SEC2
setopt    numeric_glob_sort            # [unset] enables numeric order in globs
setopt    notify                       # [on] this will put info from finished background processes over the current line
setopt    function_arg_zero            # [on] this will fill $0 with the function name, not 'zsh'
# POSIX_BUILTINS                # find out about this one
setopt    complete_in_word             # [unset] tab completion within words

setopt    multios                      # this enables various goodness
                                       # ls > foo > bar
                                       # cmd > >(cmd1) > >(cmd2) # would redirect stdout from cmd to stdin of cmd1,2
                                       # make install > /tmp/logfile | grep -i error
setopt    braceccl                     # {a-z} {0-2} etc expansion
setopt    prompt_subst                 # allow substition with $PS1, etc. Needed for vcs_info

autoload  compinit;compinit            # this enables autocompletion for pretty much everything
autoload  colors                       # use colors
colors
autoload  -Uz zmv                      # move function
autoload  -Uz zed                      # edit functions within zle


