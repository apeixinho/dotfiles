#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR="vim" 
eval "$(rbenv init -)"

if [ -f /usr/bin/virtualenvwrapper.sh ]
then
	export WORKON_HOME=~/.virtualenvs
	source /usr/bin/virtualenvwrapper.sh
fi

if [ -d ~/.local/bin/ ]; then PATH=$PATH:~/.local/bin/ ;fi
