# Variables {{{
# }}}

# Functions {{{
function jira_create() {
  local project="$1"
  local issueType="${2:-Story}"
  local jira=$(which jira)

  $jira create -p $project -i "$2" --override reporter=$(whoami)
}
# }}}


# Aliases {{{
alias ,jc="jira_create"
alias ,je="$EDITOR $0 && source $0"
# }}}
