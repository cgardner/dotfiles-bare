# vim: foldmethod=marker
# Variables {{{
export LEDGER_ROOT="$HOME/.config/ledger"
export TIME_LOG="$LEDGER_ROOT/timelog.ledger"
export FINANCE_LOG="$LEDGER_ROOT/finance.ledger"
export CONDO_LOG="$LEDGER_ROOT/condo.ledger"
export INCOME_LOG="$LEDGER_ROOT/income.ledger"
# }}}

# Functions {{{
function ledger_monthly_balance() {
  local config_file=$1
  local start=$2
  local end=$3
  ledger -f $config_file balance -b $start -e $end
}

function ledgerfunc () {
  local config_file="$1"; shift
  local action=$1

  case $action in 
    "edit")
      $EDITOR $config_file
      ;;
    "copy")
      shift
      local entry_name=$1
      ledger -f $config_file entry $entry_name >> $config_file && $EDITOR $config_file
      ;;
    "cur" | "current")
      local start=$(date +%Y-%m-01)
      local end=$(date -v +1d +%Y-%m-%d)
      ledger_monthly_balance $config_file $start $end
      ;;
    "prev" | "previous")
      local this_month=$(date +%Y-%m-01)
      local start=$(date -j -f "%Y-%m-%d" -v -1m "$this_month" "+%Y-%m-%d")
      local end=$(date -j -f "%Y-%m-%d" -v -1d "$this_month" "+%Y-%m-%d")
      ledger_monthly_balance $config_file $start $end
      ;;
    "start" | "finish" | "end")
      shift
      local in_out="i";
      if [[ "$action" == "finish" || "$action" == "end" ]]; then
        in_out="o"
      fi
      # start a time log
      echo "$in_out $(date +"%Y/%m/%d %H:%M:%S") $@" >> $config_file
      ;;
    "bal")
      shift
      ledger -f $config_file balance -C
      ;;
    *)
      ledger -f $config_file $@
      ;;
  esac
}
# }}}

# Aliases {{{
alias condo="ledgerfunc $CONDO_LOG"
alias ,lc="ledgerfunc $CONDO_LOG"
alias ttime="ledgerfunc $TIME_LOG"
alias ,lt="ledgerfunc $TIME_LOG"
alias finance="ledgerfunc $FINANCE_LOG"
alias ,lf="ledgerfunc $FINANCE_LOG"
alias income="ledgerfunc $INCOME_LOG"
alias ,li="ledgerfunc $INCOME_LOG"
# }}}

