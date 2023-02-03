HOMEBREW_PREFIX=$(brew config |rg HOMEBREW_PREFIX | awk '{ print $2 }')
PATHS=(
  "$HOMEBREW_PREFIX/bin"
  "$HOMEBREW_PREFXI/opt/ruby"
  "./node_modules/.bin"
  "${HOME}/go/bin"
  "${HOME}/.cargo/bin"
  "${HOME}/.joplin-bin/bin/"
  "${HOME}/Library/Python/3.7/bin/"
  "/usr/local/opt/openjdk/bin/"
)

PATH="$(printf "%s:" "${PATHS[@]}")$PATH"


