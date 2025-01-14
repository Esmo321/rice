#                   ___           ___           ___           ___           ___
#    _____         /  /\         /  /\         /__/\         /  /\         /  /\
#   /  /::\       /  /::\       /  /:/_        \  \:\       /  /::\       /  /:/
#  /  /:/\:\     /  /:/\:\     /  /:/ /\        \__\:\     /  /:/\:\     /  /:/
# /  /:/~/::\   /  /:/~/::\   /  /:/ /::\   ___ /  /::\   /  /:/~/:/    /  /:/  ___
#/__/:/ /:/\:| /__/:/ /:/\:\ /__/:/ /:/\:\ /__/\  /:/\:\ /__/:/ /:/___ /__/:/  /  /\
#\  \:\/:/~/:/ \  \:\/:/__\/ \  \:\/:/~/:/ \  \:\/:/__\/ \  \:\/:::::/ \  \:\ /  /:/
# \  \::/ /:/   \  \::/       \  \::/ /:/   \  \::/       \  \::/~~~~   \  \:\  /:/
#  \  \:\/:/     \  \:\        \__\/ /:/     \  \:\        \  \:\        \  \:\/:/
#   \  \::/       \  \:\         /__/:/       \  \:\        \  \:\        \  \::/
#    \__\/         \__\/         \__\/         \__\/         \__\/         \__\/
#
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

#Let ctrl+s and ctrl+q free for use
stty stop ''; stty start '';
stty -ixon
shopt -s autocd

#Glorious vim mode
set -o vi

#colors in ps1
export PS1="\[\033[38;5;14m\]\u@\[$(tput sgr0)\]\[\033[38;5;198m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;226m\]>\[$(tput sgr0)\]"
#no colors in ps1
#export PS1="\u @\h >\[$(tput sgr0)\]"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/.local/gems"
