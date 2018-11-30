#
# ~/.bashrc
#

[[ $- != *i* ]] && return

#opens man pages in nano
#disabled as it fills pages with ugly color escapes
#export MANPAGER="nano -"

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

#aliases

alias ls='ls --color=auto'
#remove orphans
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)' 

# Escaped ANSI colors...
BLD="\[\e[21m\]"
BLK="\[\e[30m\]"
RED="\[\e[31m\]"
GRN="\[\e[32m\]"
YEL="\[\e[33m\]"
BLU="\[\e[34m\]"
MAG="\[\e[35m\]"
CYN="\[\e[36m\]"
WHT="\[\e[37m\]"
LBLK="\[\e[90m\]"
LRED="\[\e[91m\]"
LGRN="\[\e[92m\]"
LYEL="\[\e[93m\]"
LBLU="\[\e[94m\]"
LMAG="\[\e[95m\]"
LCYN="\[\e[96m\]"
LWHT="\[\e[97m\]"
RESET="\[\e[0m\]"

# Custom prompt
export PS1="${LGRN}\u${WHT}@${LCYN}\h ${RESET}\W$ "
