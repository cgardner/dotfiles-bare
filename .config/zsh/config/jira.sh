# Variables {{{
# }}}

# Functions {{{
function jira_create() {
  local project="$1"
  local jira=$(which jira)

  $jira create -p $project -i "Story" --override reporter=$(whoami)
}
# }}}


# Aliases {{{
alias ,jc="jira_create"
# }}}
