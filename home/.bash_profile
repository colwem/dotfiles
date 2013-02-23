#
# ~/.bash_profile
#
. /etc/profile.d/infinality-settings.sh

#[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 && $NO_AUTO_START_X -ne 1 ]]; then
    export NO_AUTO_START_X=1
    exec startx &>> .xoutput
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load bashrc anyway


