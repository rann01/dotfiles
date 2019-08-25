#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH="${PATH}:/usr/local/bin"

#display a neofetch at login
neofetch
