# Path to your oh-my-zsh installation.
  export ZSH=/Users/atdog/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    autojump
    rvm
    pyenv
    zsh-completions
)

# User configuration

export PATH="/Users/atdog/.rvm/gems/ruby-2.2.3/bin:/Users/atdog/.rvm/gems/ruby-2.2.3@global/bin:/Users/atdog/.rvm/rubies/ruby-2.2.3/bin:/Users/atdog/.pyenv/shims:/Users/atdog/.pyenv/versions/2.7.10/bin:/Users/atdog/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/Users/atdog/Android/ndk:/Users/atdog/Android/sdk/platform-tools:/Users/atdog/Android/sdk/tools:/Users/atdog/Android/sdk/build-tools/21.1.2:.:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/atdog/bin:/usr/local/sbin:/Users/atdog/.rvm/bin:/Users/atdog/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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


# change dir without cd
setopt autocd

# for ls color
eval `dircolors $HOME/.rcfiles/dircolors.256dark`

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

hash -d ctf="/Users/atdog/Desktop/work/workspace/ctf/"
hash -d des="/Users/atdog/Desktop/"

if [ `uname` = "Darwin" ]; then
    function o {
        if [ -n "$*" ]; then
            open "$*"
        else
            open .
        fi
    }
fi
