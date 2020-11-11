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
export RELEASE_REMIND="$REMIND_ROOT/deployments.rem"
export ORGANIZE_REMIND="$REMIND_ROOT/organize.rem"
# }}}
# Functions {{{
function remind () {
  local config_file="$1"; shift
  local action=$1

  local flags=("-gaadd" "-q" "-iCOLOR=1")
  local git_flags=("--git-dir=$REMIND_ROOT/.git" "--work-tree=$REMIND_ROOT")

  if [ ${REMIND_DEBUG:-0} -ne 0 ]; then
    echo "Setting verbose flag"
    flags+=("-dextvlf")
    echo "flags: $flags"
  fi

  case $action in
    "next")
      remind -z \
        -k"osascript -e 'display alert \"Todays Agenda\" message \"%s\"'" \
        $config_file &
      ;;
    "agenda")
      local agendaFlags=("-gaa" "-q")
      local upcoming=$(command remind $agendaFlags $config_file)
      # local upcoming=$(command remind $agendaFlags $config_file | gsed -r "s/\x1B\[(([0-9]{1,2})?(;)?([0-9]{1,2})?)?[m,K,H,f,J]//g")

      osascript -e "display alert \"Todays Agenda\" message \"${upcoming}\"" >/dev/null 2>&1
      ;;
    "month")
      local num_months=${2:-1}
      command remind $flags -c${num_months} $config_file
      ;;
    "week")
      command remind $flags -ca+1 $config_file
      ;;
    "edit")
      $EDITOR $config_file
      ;;
    "g" | "git")
      shift
      command git $git_flags $@
      ;;
    "ci" | "commit")
      shift
      command git $git_flags add $config_file
      command git $git_flags commit $@
      ;;
    *)
      command remind $flags $@ $config_file
      ;;
  esac
}
#}}}
# Aliases {{
alias ,r="remind $ALL_REMIND"
alias ,rw="remind $WORK_REMIND"
alias ,rh="remind $HOME_REMIND"
alias ,ro="remind $ORGANIZE_REMIND"
alias ,rhol="remind $HOLIDAY_REMIND"
alias ,rrel="remind $RELEASE_REMIND"
alias ,re="$EDITOR $0 && source $0" # Edit this file
alias ,rg="remind git"
# }}}
