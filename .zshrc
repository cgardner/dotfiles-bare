time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

source ~/.config/zsh/zshrc.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
