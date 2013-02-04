export SVN_EDITOR=vim
export PATH=/Users/atdog/.rvm/gems/ruby-1.9.3-p374/bin:/usr/local/share/npm/bin:/usr/local/bin:${PATH}:/Users/atdog/bin:/Users/atdog/eclipse-android/eclipse-indigo:/usr/local/sbin
export PATH=.:$PATH
export PYTHONPATH=/Library/Python/2.7/site-packages
export ARCHFLAGS="-arch x86_64"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r21
export ANDROID_HOME=/usr/local/Cellar/android-sdk/r21
export tor="140.113.208.227:65000"
export LANG="zh_TW.UTF-8"

# for Mac OSX
if [ `uname` = "Darwin" ]; then
    # for autojump
    [[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    # for android sdk
    export PATH=/usr/local/Cellar/android-sdk/r21/tools:$PATH
    export PATH=/usr/local/Cellar/android-sdk/r21/platform-tools:$PATH
    #export PATH=~/android-ndk:$PATH
    #
    export PATH=~/bin:$PATH
    export EDITOR=vim
    # mysql
    #alias mysql=/usr/local/mysql/bin/mysql
    #alias mysqladmin=/usr/local/mysql/bin/mysqladmin
    #
    alias gitx="open . -a gitx"
    alias wireshark="open ~/.wireshark -a wireshark"
    alias d="door"
    alias cls="clear"
    # perl brew
    #. ~/perl5/perlbrew/etc/bashrc
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

csie () {
    if [ -n "$*" ]; then
        ssh r99922158@linux${*}.csie.ntu.edu.tw
    else
        ssh r99922158@linux2.csie.ntu.edu.tw
    fi
}


alias sr="screen -rdaA"
alias pssh="ssh -o 'ProxyCommand /usr/bin/nc -x $tor %h %p'"
alias sc="screen"
alias grep="grep --color"
alias rm="rm -i"
alias mv="mv -i"
alias ll="ls -lFa"
alias llh="ls -lFah"
alias la="ls -a"
alias ls="ls -GF"
alias cp="cp -i"
alias cls="clear"
alias ip="echo \`curl -s http://orange.tw | sed 's/<br>//' | tr  $'\r\n' ' ' \`"
alias tip="echo \`curl --socks4 $tor -s http://orange.tw | sed 's/<br>//' | tr  $'\r\n' ' ' \`"

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

if [ $TERM == "xterm-color" -o $TERM == "xterm-256color" ]; then
    # set this "dm4@dm4-macbook 20:42 [~]$ "
    #           \u  \h          \A     \w\$
    # \033k\033\\\\ if for screen title
    #export PS1="\[\033k\033\\\\\e[38;5;244m\]\A [\w]\$(git_branch)\[\e[0m\]\$ "
    #export PS1="\033k\033\\\\\e[38;5;59m\u@\h \A [\w] \e[0m\$ "
    #export PS1="\[\033k\033\\\\\e[36m\]\A\[\e[33m\] [\w] \[\e[36m\]\$(git_branch)\[\e[0m\]\$ "
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

# open screen
#if [ $SHLVL == 1 ]; then
#    if [ $TERM == "xterm-color" ]; then
#        /usr/local/bin/screen -RD
#    fi
#fi

if [ -e ~/perl5/perlbrew/etc/bashrc ]; then
    source ~/perl5/perlbrew/etc/bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


if [ "$PS1" ]; then
    complete -cf sudo
fi

# dm4 prompt 
# [~] ➟
function _arrow_prompt {
    if [ `uname` == "Darwin" ]; then
        export PS1="\[\e[0;35m\]\$(git_branch)\[\e[1;37m\][\[\e[1;30m\]\w\[\e[0m\]] \[\e[1;35m\]➟  \[\e[m\]"
    else 
        export PS1="\h \[\e[0;35m\]\$(git_branch)\[\e[1;37m\][\w] \[\e[1;35m\]➟  \[\e[m\]"
    fi
}

# ★  15:36 [~] ---------
# $
function _seperated_prompt {
    newPWD=`echo -n $PWD | perl -p -e "s{$HOME}{~}"`
    local temp="11:11 [${newPWD}] $(git_branch) "
    local fillsize=$((${COLUMNS}-${#temp}))
    fill=`perl -e "print '-'x$fillsize if $fillsize > 0;"`
    # ★ ❤
    export PS1="\n\[\e[1;33m\]\A \[\e[1;33m\][\${newPWD}] \[\e[0;35m\]\$(git_branch)\[\e[0;37m\]\${fill}\n\[\e[0m\]$ "
}

# for powerline-bash
function _powerline_prompt {
    export PS1="$(~/.rcfiles/powerline-shell.py $?)"
}

# switch prompt
function pmt {
    export _prompt_setting=`perl -e "print (($_prompt_setting+1)%3)"`
    if [ $_prompt_setting = 0 ]; then
        export PROMPT_COMMAND="_arrow_prompt"
    elif [ $_prompt_setting = 1 ]; then
        if [ ! -f ~/.rcfiles/powerline-shell.py ]; then
            curl -s -o ~/.rcfiles/powerline-shell.py https://raw.github.com/milkbikis/powerline-shell/master/powerline-shell.py
            chmod +x ~/.rcfiles/powerline-shell.py
        fi
        export PROMPT_COMMAND="_powerline_prompt"
    elif [ $_prompt_setting = 2 ]; then
        export PROMPT_COMMAND="_seperated_prompt"
    fi
}

# prompt setting
export _prompt_setting=0
export PROMPT_COMMAND="_arrow_prompt"
# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" gssh
complete -W "$(echo `cat ~/.bash_history | egrep '^(p|g)?ssh ' | sort | uniq | sed 's/^ssh //'`;)" pssh
