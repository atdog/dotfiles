export CLICOLOR=1
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
export TERM="xterm-256color"


# for Mac OSX
if [ `uname` = "Darwin" ]; then
    # for autojump
    [[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    # for android sdk
    export PATH=/Users/atdog/Android/sdk/build-tools/21.1.2:$PATH
    export PATH=/Users/atdog/Android/sdk/tools:$PATH
    export PATH=/Users/atdog/Android/sdk/platform-tools:$PATH
    export PATH=/Users/atdog/Android/ndk:$PATH
    # for gnu sed
    export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
    # for gnu bin
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    #
    export PATH=~/bin:$PATH
    export EDITOR=vim
    export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
    export TOR="127.0.0.1:9050"
    alias cls="printf \"\033c\""
    # bash_completion
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
    if [ -f `which docker-machine` ]; then
        function dm {
            if [ -n "$*" ]; then
                docker-machine $* default
            fi
        }
        alias dminit='eval "$(dm env)"'
        alias ssh_docker='ssh -p 2222 $(dm ip) -l root'

        function dockup {
            if [[ `dm status` == "Stopped" ]]; then
                dm start
            fi
            echo "Eval env variable..."
            dminit
            echo "Start all exited container..."
            docker ps -a | tail -n -1 | grep Exited | cut -d ' ' -f 1 | xargs -n 1 -I {} docker start {}
            echo "Login Docker image..."
            while [[ `docker ps -a | grep Exit | wc -l` != 0 ]]; do
                sleep 1
            done
            ssh_docker
        }

        function dockdown {
            echo "Stop all exited container..."
            docker ps -a | tail -n -1 | grep Up | cut -d ' ' -f 1 | xargs -n 1 -I {} docker stop {}
            while [[ `docker ps -a | grep Up | wc -l` != 0 ]]; do
                sleep 1
            done
            if [[ `dm status` == "Running" ]]; then
                echo "Shutdown VM..."
                echo "sudo shutdown -h now" | dm ssh
                while [[ `dm status` != "Stopped" ]]; do
                    sleep 1
                done
                echo Status: `dm status`
            fi
        }
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
alias ll="ls --color=auto -lFah"
alias la="ls --color=auto -a"
alias ls="ls --color=auto -GF"
alias sl="ls --color=auto -GF"

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
[[ -e $HOME/.pyenv/ ]] && export PATH="$PYENV_ROOT/versions/2.7.9/bin:$PATH"
[[ -e $HOME/.pyenv/ ]] && eval "$(pyenv init -)"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# sudo autocomplete
if [ "$PS1" ]; then
    complete -cf sudo
fi

# dm4 prompt
# [~] ➟
if [ `uname` == "Darwin" ]; then
    export PS1="\[\e[38;5;171m\]\$(git_branch)\[\e[1;37m\][\[\e[38;5;137m\]\w\[\e[0m\]\[\e[1;37m\]] \[\e[38;5;69m\]➟  \[\e[m\]"
else
    export PS1="\h \[\e[38;5;171m\]\$(git_branch)\[\e[1;37m\][\[\e[38;5;137m\]\w\[\e[0m\]\[\e[1;37m\]] \[\e[38;5;69m\]➟  \[\e[m\]"
    [[ -f /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
fi
# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" gssh
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" pssh

# for ls color
eval `dircolors $HOME/.rcfiles/dircolors.256dark`
