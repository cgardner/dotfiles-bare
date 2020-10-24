
# Functions {{{
news() {
  newsboat -d ~/.logs/newsboat.log -l 6
}
# }}}

# Aliases {{{
alias ,n="news"
alias ,ne="$EDITOR $0 && source $O"
# }}}

