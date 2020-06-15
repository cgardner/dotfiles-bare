alias zref="source $HOME/.zshrc"

# upgrayedd {{{
alias upgrayedd='brew upgrade && \
  brew cask upgrade && \
  brew cleanup && \
  nvim -c "PlugUpdate" -c "PlugUpgrade" -c "PlugClean" -c "qa!" && \
  npm-check -y -g' 
# }}}

# tmuxinator {{{
alias mux="tmuxinator"
alias muxs="tmuxinator start"
alias p="tmuxinator start project"
alias dp="tmuxinator start project "
# }}}

# tmux {{{
alias tmk="tmux kill-session -t "

alias goproj="tmuxinator start go-project"
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
# }}}

alias tf="terraform"

alias pl="ls $HOME/src"

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

