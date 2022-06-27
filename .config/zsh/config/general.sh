# vim: fdm=marker
# Zshrc {{{
alias zref="source $home/.zshrc"
alias ,zr="zref"
alias ,ze="$editor $home/.config/zsh/zshrc.sh && source $home/.config/zsh/zshrc.sh"
# }}}
# upgrayedd {{{
alias upgrayedd='pip3 install -U meta-package-manager && mpm sync && mpm upgrade' 
# }}}
# tmuxinator {{{
alias ,mux="mux"
alias muxs="tmuxinator start"
alias ,muxs="muxs"
alias p="tmuxinator start project"
alias ,p="p"
alias goproj="tmuxinator start go-project"
# }}}
# tmux {{{
alias tmk="tmux kill-session -t "
alias ,tmx="tmk"
alias ,tml="tmux list-session"
# }}}
# gopass {{{
alias ,gp="gopass show -c "
# }}}
# git {{{
alias g="git"

clone() {
  REPO_URL=$1
  pushd $HOME/src
  git clone $REPO_URL
  popd
}

gupdate() {
  git fetch origin
  git checkout develop
  git pull origin develop
  git checkout master
  git pull origin master
}
# }}}

alias pl="ls $HOME/src"

alias docker="podman"

# Helpers {{{
md() {
  mkdir -p $1
  cd $1
}

c() {
  cd $1
  ls
}
alias cd="c"

mdown() {
  pandoc "$1" | w3m -T text/html
}

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

get_recipe()
{
  curl -sG "https://plainoldrecipe.com/recipe" -d "url=${1}" | \
    pandoc -f html -t markdown --atx-headers
}

ytdl() {
  youtube-dl -f best -o '~/Downloads/Videos/%(title)s.%(ext)s' "${1}"
}
# }}}

