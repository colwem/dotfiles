#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f /etc/bash_completion ] && . /etc/bash_completion
[ -f /usr/share/doc/pkgfile/command-not-found.bash ] &&
     . /usr/share/doc/pkgfile/command-not-found.bash 

# use powerline. can cause trouble if it's sourced twice
if [ -f /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    if [[ $POWERLINE_LOADED -ne 1 ]]; then
        . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
    fi
    export POWERLINE_LOADED=1 
fi

# PS1='[\u@\h \W]\$ '

# aliases
alias git='hub'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias more='less'
alias p='less'
alias ping='ping -c 3'
alias python='python2'
#alias vim='xrdb -remove; xrdb ~/.Xresources; vim'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls -hF --color=auto'
alias lr='ls -R'
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'
alias lz='ll -rS'
alias lt='ll -rt'
alias lm='la | less'

alias pac='sudo /usr/bin/pacman -S'
alias pacA='sudo /usr/bin/pacman -U'

alias pacu='/usr/bin/pacman -Syu'
alias pacs='/usr/bin/pacman -Ss'
alias pacq='/usr/bin/pacman -Qs'
alias pacl='/usr/bin/pacman -Ql'

alias mkpkg='makepkg -s'

alias restart='sudo restart'
alias poweroff='sudo poweroff'
# bash settings

shopt -s autocd
shopt -s checkwinsize
set -o vi # set vi style cl editing

eval $(dircolors -b) #enhance ls colors

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '

# add colors to man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

export PATH="$PATH:$HOME/bin:$HOME/.cabal/bin:."

[ -n "$DISPLAY" ] && BROWSER=chromium

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
