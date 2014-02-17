#!/bin/bash
# vim: set ts=2 sw=2 tw=2
#
# License: BSD
# To use this script source this file in your .bashrc
# [[ -s "$HOME/path_to_this_script/marks.sh" ]] && . $HOME/path_to_this_script/marks.sh
#
# usage:
# mark foo   #=> creates a link to the current working directory in your ~/.marks folder
# jump foo   #=> changes directory to your mark named foo
# unmark foo #=> removes the mark for foo
# marks      #=> lists your marks
#
#
export MARKPATH=$HOME/.marks

function jump {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function mark {
	if [ $# -eq 0 ]; then
		echo "No arguments supplied"
	else
		mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
	fi
}

function unmark {
	if [ $# -eq 0 ]; then
		echo "No arguments supplied"
	else
		rm -i "$MARKPATH/$1"
	fi
}

function marks {
	ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function _completemarks() {
	local curw=${COMP_WORDS[COMP_CWORD]}
	local wordlist=$(find $MARKPATH -type l -printf "%f\n")
	COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
	return 0
}
complete -F _completemarks jump unmark
