source <("$(brew config |rg HOMEBREW_PREFIX | awk '{ print $2 }')/bin/starship" init zsh --print-full-init)
