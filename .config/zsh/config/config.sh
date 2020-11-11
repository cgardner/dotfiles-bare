# Utilities {{{
function _config() {
  local git=$(which git)
  local flags=("--git-dir=${HOME}/.cfg" "--work-tree=${HOME}")
  case $1 in
    "reset")
      $git $flags reset HEAD
      ;;
    *)
      $git $flags $@
      ;;
  esac
}
# }}}
# Aliases {{{
alias ,c="_config"
alias ,ce="$EDITOR $0 && source $0"
# }}}
