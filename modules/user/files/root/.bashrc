# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ll='ls -l'
export  PS1="\[\e[31m\]\u@\h:\[\e[35m\]\W\[\e[0m\]\\$ "
