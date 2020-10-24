# vim: foldmethod=marker

# Aliases {{{
TASK_APP="$(which dstask)"
alias t="$TASK_APP"
alias ,t="$TASK_APP"
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
