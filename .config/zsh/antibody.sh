#!/usr/bin/env zsh
antibody() {
	case "$1" in
	bundle)
		source <( /usr/local/bin/antibody $@ ) || /usr/local/bin/antibody $@
		;;
	*)
		/usr/local/bin/antibody $@
		;;
	esac
}

_antibody() {
	IFS=' ' read -A reply <<< "help bundle update home purge list init"
}
compctl -K _antibody antibody

