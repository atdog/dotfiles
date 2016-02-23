if [ `uname` = "Darwin" ]; then
    export ZSH=/Users/atdog/.oh-my-zsh
else
    export ZSH=/home/atdog/.oh-my-zsh
fi

ZSH_THEME="robbyrussell"

HIST_STAMPS="mm/dd/yyyy"

plugins=(
    git
    autojump
    rvm
    pyenv
    zsh-completions
)

# User configuration
if [ `uname` = "Darwin" ]; then
    # for gnu
    path=(
        /usr/local/opt/gnu-sed/libexec/gnubin
        /usr/local/opt/coreutils/libexec/gnubin
        $path
    )
    manpath+=(
        /usr/local/opt/gnu-sed/libexec/gnuman
        /usr/local/opt/coreutils/libexec/gnuman
    )
    function o {
        if [ -n "$*" ]; then
            open "$*"
        else
            open .
        fi
    }
    hash -d ctf="/Users/atdog/Desktop/work/workspace/ctf/"
    hash -d des="/Users/atdog/Desktop/"
fi

path+=(
    /usr/local/bin
    /usr/local/sbin
    ~/bin
)

source $ZSH/oh-my-zsh.sh

# brew
export HOMEBREW_GITHUB_API_TOKEN=580935a06ff3cf61185eac63dc2c0486c57daaa4

# Language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

eval my_gray='$FG[237]'
RPROMPT='$my_gray%n@%m%{$reset_color%}%'

# change dir without cd
setopt autocd

# for ls color
eval `dircolors $HOME/.rcfiles/dircolors.256dark`

# editor
export SVN_EDITOR=vim
export EDITOR=vim

# for 256 color
export TERM="xterm-256color"

# alias
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias grep="grep --color"
alias ll="ls --color=auto -lFah"
alias la="ls --color=auto -a"
alias ls="ls --color=auto -GF"
alias sl="ls --color=auto -GF"
alias cls="printf \"\033c\""

# pyenv & rvm
[[ -e $HOME/.pyenv/ ]] && export PYENV_ROOT="$HOME/.pyenv"
[[ -e $HOME/.pyenv/ ]] && export PATH="$PYENV_ROOT/versions/2.7.10/bin:$PATH"
[[ -e $HOME/.pyenv/ ]] && eval "$(pyenv init -)"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


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

bindkey '^R' history-incremental-search-backward
bindkey '^V' history-incremental-search-forward
