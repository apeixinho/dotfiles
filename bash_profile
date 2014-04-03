#!/usr/bin/env bash

# Add rvm gems and nginx to the path
export PATH=/usr/bin/:$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin:~/.local/bin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Load Bash It
if [ -f $BASH_IT/bash_it.sh ]; then source $BASH_IT/bash_it.sh fi

# lazy add local bin
if [ -d ~/.local/bin/ ]; then PATH=$PATH:~/.local/bin/ ;fi

# lazy add chromium
if [ -f /usr/bin/chromium ]; then export CHROME_BIN='/usr/bin/chromium' ;fi

# lazy add JAVA_HOME
if [ -d /usr/lib/jvm/java-7-openjdk ]; then export JAVA_HOME='/usr/lib/jvm/java-7-openjdk' ;fi

# lazy add JAVA_HOME
if [ -d /opt/maven ]; then export M2_HOME='/opt/maven' ;fi

