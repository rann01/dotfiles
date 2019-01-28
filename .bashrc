#
# ~/.bashrc
#

[[ $- != *i* ]] && return

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
#open manpages in nano
nanoman() {
	/usr/bin/man "$1" > ~/.mantemp.txt && nano ~/.mantemp.txt
}
alias man='nanoman'

#James Fenn's magical gcc aliases
# gcc  - acts as an alias of gcc; enables all warning flags, treats warnings as
#        errors, and sets the output file to the name of the source file.
#
# Arguments should be passed to this alias after the name of the source file,
# not before it; while gcc doesn't explicitly state it, it does accept the source
# as the first argument, allowing additional arguments to be passed to this alias
# without breaking the format.
#
# Ex:
#   gcc --std=c99 test.c          Creates two binaries, "./--std=c99" and "./test",
#                                 both of which contain the binary of "./test.c".
#
#   gcc test.c --std=c99          Creates one binary, "./test", using c99.
#
gcc() { /usr/bin/gcc $@ -Wall -Werror -o ${1%.*}; }

# gccx - runs gcc (the alias above), then executes the compiled binary.
gccx() { gcc $@ && command $(realpath "${1%.*}"); }


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
