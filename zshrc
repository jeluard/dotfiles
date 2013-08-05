# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="minimal"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(command-coloring git lein svn osxi vi-mode)

unsetopt correctall

source $ZSH/oh-my-zsh.sh

bindkey -v
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

setopt menu_complete
unsetopt nomatch
unsetopt share_history
unsetopt inc_append_history
zstyle -e ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR=vim

function vir
{
  tmux new-session -d -s vir
  tmux new-window -t vir:2 -n 'vim' "vim $*"
  tmux split-window -d -t vir:2 -p 25 -v 'lein repl'
  tmux attach-session -t vir
}

function bigfiles
{
  tree -ah --du . | ack '\[(\d{3,}M|\d+.*G)\]'
}
