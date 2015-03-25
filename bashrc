# for ls color
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export SVN_EDITOR=vim
export EDITOR=vim
export PATH=/usr/local/bin:${PATH}:/Users/atdog/bin:/usr/local/sbin
export PATH=.:$PATH
export PYTHONPATH=/Library/Python/2.7/site-packages
export ARCHFLAGS="-arch x86_64"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HOMEBREW_GITHUB_API_TOKEN=580935a06ff3cf61185eac63dc2c0486c57daaa4
export PAGER="`which less` -s"

# for Mac OSX
if [ `uname` = "Darwin" ]; then
    # for autojump
    [[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    # for android sdk
    export PATH=/Users/atdog/Android/sdk/tools:$PATH
    export PATH=/Users/atdog/Android/sdk/platform-tools:$PATH
    export PATH=/Users/atdog/Android/ndk:$PATH
    # for gnu sed
    export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
    #
    export PATH=~/bin:$PATH
    export EDITOR=vim
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    export TOR="127.0.0.1:9050"
    alias cls="printf \"\033c\""
    # bash_completion
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
    if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
        . `brew --prefix`/etc/bash_completion.d/git-completion.bash
    fi
    # open in finder
    function o {
        if [ -n "$*" ]; then
            open "$*"
        else
            open .
        fi
    }
fi


alias ..="cd .."
alias -- -="cd -"
alias sr="screen -rdaA"
alias pssh="ssh -o 'ProxyCommand /usr/bin/nc -x $TOR %h %p'"
alias sc="screen"
alias grep="grep --color"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias cls="printf \"\033c\""
alias rscp='rsync -v -P -e ssh'
alias ip="echo \`curl -s http://orange.tw | sed 's/<br>//' | tr  $'\r\n' ' ' \`"
alias tip="echo \`curl --socks4 $TOR -s http://orange.tw | sed 's/<br>//' | tr  $'\r\n' ' ' \`"

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

if [ $TERM == "xterm-color" -o $TERM == "xterm-256color" ]; then
    # colorful man page
    export PAGER="`which less` -s"
    export BROWSER="$PAGER"
    export LESS_TERMCAP_mb=$'\E[38;5;167m' # begin blinking
    export LESS_TERMCAP_md=$'\E[38;5;39m' # begin bold
    export LESS_TERMCAP_me=$'\E[0m' # end mode
    export LESS_TERMCAP_se=$'\E[38;5;231m' # end standout-mode
    export LESS_TERMCAP_so=$'\E[38;5;167m' # begin standout-mode - info box
    export LESS_TERMCAP_us=$'\E[38;5;167m' # begin underline
    export LESS_TERMCAP_ue=$'\E[0m' # end underline
fi

[[ -e $HOME/.pyenv/ ]] && export PYENV_ROOT="$HOME/.pyenv"
[[ -e $HOME/.pyenv/ ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -e $HOME/.pyenv/ ]] && eval "$(pyenv init -)"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# sudo autocomplete
if [ "$PS1" ]; then
    complete -cf sudo
fi

# dm4 prompt
# [~] ➟
if [ `uname` == "Darwin" ]; then
    export PS1="\[\e[38;5;171m\]\$(git_branch)\[\e[1;37m\][\[\e[38;5;137m\]\w\[\e[0m\]\[\e[1;37m\]] \[\e[38;5;69m\]➟  \[\e[m\]"
    alias ll="ls -lFah"
    alias la="ls -a"
    alias ls="ls -GF"
else
    export PS1="\h \[\e[38;5;171m\]\$(git_branch)\[\e[1;37m\][\[\e[38;5;137m\]\w\[\e[0m\]\[\e[1;37m\]] \[\e[38;5;69m\]➟  \[\e[m\]"
    alias ll="ls --color -lFah"
    alias la="ls --color -a"
    alias ls="ls --color -GF"
    [[ -f /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
fi
# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" gssh
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" pssh
