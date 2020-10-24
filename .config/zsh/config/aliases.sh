# vim: foldmethod=marker
# upgrayedd {{{
alias upgrayedd='brew upgrade; \
  brew cleanup ; \
  nvim -c "PlugUpdate" -c "PlugUpgrade" -c "PlugClean" -c "qa!" ; \
  npm-check -y -g' 
# }}}

# tmux {{{
alias mux="tmuxinator"
alias ,mux="mux"
alias muxs="tmuxinator start"
alias ,muxs="muxs"
alias p="tmuxinator start project"
alias ,p="p"
alias goproj="tmuxinator start go-project"
alias ,gp="goproj"

alias tmk="tmux kill-session -t "
alias ,tmx="tmk"
alias ,tml="tmux list-session"

# }}}

# git {{{
alias g="GPG_TTY=$(tty) git"
alias ,g="git"
clone() {
  REPO_URL=$1
  pushd $HOME/src
  git clone $REPO_URL
  popd
}
# }}}

# Shortcuts {{{
md() {
  mkdir -p $1
  cd $1
}
# }}}

# Helpers {{{

alias zref="source $HOME/.zshrc"
alias ,zr="zref"
alias ,ze="$EDITOR $HOME/.config/zsh/zshrc.sh && source $HOME/.config/zsh/zshrc.sh"

mdown() {
  pandoc "$1" | w3m -T text/html
}

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}
# }}}

# Utilities {{{
get_recipe()
{
  curl -sG "https://plainoldrecipe.com/recipe" -d "url=${1}" | \
    pandoc -f html -t markdown --atx-headers
}

ytdl() {
  youtube-dl -f best -o '~/Downloads/Videos/%(title)s.%(ext)s' "${1}"
}
# }}}
