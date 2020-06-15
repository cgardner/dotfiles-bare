## NODE

node_docker() {
  # Allow manual version override
  [ -z "$NODE_VERSION" ] && NODE_VERSION="latest";

  # NVM is always more important
  [ -s ".nvmrc" ] && NODE_VERSION=$(cat .nvmrc)
  
  docker run -it --rm -v $(pwd):/app --workdir /app node:$NODE_VERSION $@
}
#
#npm() {
#  node_docker npm $@
#}
#
#node() {
#  node_docker node $@
#}

alias nr="npm run"
alias ni="npm i"

# NVM
NVM_DIR="$HOME/.nvm"
NVM_LOADED=0
nvm() {
  if [ $NVM_LOADED -eq 0 ]; then
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
    NVM_LOADED=1
  fi

  nvm $@
}

