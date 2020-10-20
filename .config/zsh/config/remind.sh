# vim: foldmethod=marker
# Links {{{
# Wiki - https://www.roaringpenguin.com/wiki/index.php
# Man Pages - https://linux.die.net/man/1/remind
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

  local remind=$(which remind)
  case $action in
    "month")
      $remind -c $config_file
      ;;
    "week")
      $remind -ca+1 $config_file
      ;;
    "agenda")
      echo "TBD"
      ;;
    "edit")
      $EDITOR $config_file
      ;;
    *)
      $remind $@ $config_file
      ;;
  esac
}
#}}}
# Aliases {{{
alias ,rw="remindfunc $WORK_REMIND"
alias ,rh="remindfunc $HOME_REMIND"
alias ,ra="remindfunc $ALL_REMIND"
alias ,rhol="remindfunc $HOLIDAY_REMIND"
# }}}
