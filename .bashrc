#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias py='python'
PS1='\u@\w\$ '
EDITOR='vim'
if [ "$PS1" ]; then
	complete -cf sudo
fi

PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
force_color_prompt=yes


