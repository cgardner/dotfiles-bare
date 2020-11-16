# vim: foldmethod=marker
# Functions {{{
function dstask() {
  local action="$1"
  case $action in
    "jira")
      shift;
      JIRA_PROJECT="FLEXPLAT"

      local stories=()
      echo "Creating stories for $@ in $JIRA_PROJECT"
      for id in ${@}; do
        local summary=$(command dstask $id | jq -r '.[0].summary | tostring')
        local notes=$(command dstask $id | jq -r '.[0].notes | tostring')

        local story=$(jira create -p $JIRA_PROJECT -i 'Story' --noedit \
          --override reporter=$(whoami) --override summary="${summary}" \
          --override description="${notes}" | awk '{ print $3 }')
        stories+=($story)
      done
      command dstask $@ done
      echo $stories

      ;;
    "interview")
      command dstask add "${2}" template:65
      ;;
    "export" | "ex")
      shift
      local id="${1}"

      local summary=$(command dstask $id | jq -r '.[0].summary | tostring')
      local notes=$(command dstask $id |jq -r '.[0].notes | tostring')

      echo "${notes}" | pandoc --defaults \
        $HOME/.config/pandoc/defaults.yaml --filter pandoc-plantuml -o \
        $HOME/Downloads/$summary.docx

      echo "\"$HOME/Downloads/$summary.docx\""
      ;;
    *)
      command dstask $@
      ;;
  esac
}
# }}}
# Aliases {{{
TASK_APP="dstask"
alias ,t="$TASK_APP"
alias ,ta="$TASK_APP add"
alias ,tin="$TASK_APP show-unorganised"
alias ,tp="$TASK_APP show-projects"
alias ,tw="_task_set_context -someday -growth -personal"
alias ,tn="_task_set_context none"
alias ,tt="_task_set_context +today"

alias ,te="$EDITOR $0 && source $0"
alias ,tex="_task_export_notes"
# }}}
# Completions {{{
_dstask() {
    compadd $(dstask _completions "${words[@]}")
}

compdef _dstask dstask
# }}}
# Utilities {{{

function _task_export_notes() {
  NOTES=$($TASK_APP $1 notes)
  echo $NOTES | pandoc --defaults \
    $HOME/.config/pandoc/defaults.yaml --filter pandoc-plantuml -o \
    $HOME/Downloads/$2.docx
  echo "$HOME/Downloads/$2.docx"
}

function _task_set_context() {
  $TASK_APP context $@
  $TASK_APP
}
# }}}
