# vim: foldmethod=marker
# Links {{{
# Wiki - https://www.roaringpenguin.com/wiki/index.php/Remind
# Man Pages - https://linux.die.net/man/1/remind
# Helpful Blog Post - https://blog.thechases.com/posts/remind/
# }}}
# Variables {{{
export REMIND_ROOT="$HOME/.config/remind"
export HOME_REMIND="$REMIND_ROOT/home.rem"
export WORK_REMIND="$REMIND_ROOT/work.rem"
export ALL_REMIND="$REMIND_ROOT/all.rem"
export HOLIDAY_REMIND="$REMIND_ROOT/holidays.rem"
# }}}
# Functions {{{
function remindfunc () {
  local config_file="$1"; shift
  local action=$1

  local flags="-gaa"

  local remind=$(which remind)
  case $action in
    "month")
      local num_months=${2:-1}
      $remind $flags -c${num_months} $config_file
      ;;
    "week")
      $remind $flags -ca+1 $config_file
      ;;
    "agenda")
      echo "TBD"
      ;;
    "edit")
      $EDITOR $config_file
      ;;
    *)
      $remind $flags $@ $config_file
      ;;
  esac
}
#}}}
# Aliases {{{
alias ,rw="remindfunc $WORK_REMIND"
alias ,rh="remindfunc $HOME_REMIND"
alias ,ra="remindfunc $ALL_REMIND"
alias ,rhol="remindfunc $HOLIDAY_REMIND"
alias ,re="$EDITOR $0 && source $0" # Edit this file
alias ,rg="git --git-dir=$REMIND_ROOT/.git --work-tree=$REMIND_ROOT"
# }}}
