if [ -f $HOME/.shell_variables.sh ]; then source $HOME/.shell_variables.sh ;fi

ZSH=$HOME/.oh-my-zsh
DEFAULT_USER="andrei"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history

ZSH_THEME="awesomepanda"

# ignore duplicates in history
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

plugins=(command-not-found cp mvn systemd vagrant common-aliases dnf fasd mercurial)


if [ -f $HOME/.profile.sh ]
then
  source $HOME/.profile.sh
fi

if [ "$CONN" != "" ] && [ $CONN = "sshd" ]; then 
  ZSH_THEME="clean"
fi

export TERM='xterm-256color'

if [ -f $ZSH/oh-my-zsh.sh ]
then
  source $ZSH/oh-my-zsh.sh
fi

if [ -f $HOME/.my-aliases.sh ]
then
  source $HOME/.my-aliases.sh
fi

# Autocomplete with double tab like bash

setopt bash_autolist

if [ -f /usr/share/zsh/site-contrib/powerline.zsh ]
then
  . /usr/share/zsh/site-contrib/powerline.zsh
fi

if [ "$ATTACH_TMUX" = "true" ]; then
  export ZSH_TMUX_AUTOSTART='true'
  export ZSH_TMUX_AUTOCONNECT='true'
  if [ "$TMUX" = "" ] && [ $CONN != "sshd" ] && [ $CONN != "java" ]; then
    tmux attach || tmux new
  fi
fi

if [ -f ~/.shell_promptline.sh ]; then source ~/.shell_promptline.sh ;fi

if [ $USER = "root" ]; then
  if [ -f /root/.shell_promptline_root.sh ]; then source /root/.shell_promptline_root.sh ;fi
fi

if [ "$CONN" != "" ] && [ $CONN = "sshd" ]; then 
  ZSH_THEME="clean"
  if [ -f ~/.shell_promptline_remote.sh ]; then source ~/.shell_promptline_remote.sh ;fi
fi

if [ -f $HOME/.fzf.zsh ]; then source $HOME/.fzf.zsh ;fi
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output

if [ -d $HOME/.zsh ]
then
  source $HOME/.zsh/tmux_autocomplete.sh
fi

bindkey "^X^L" insert-last-command-output 

export TERM='screen-256color'