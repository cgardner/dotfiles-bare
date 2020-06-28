PATHS=(
  "/usr/local/sbin"
  "/usr/local/bin"
  "./node_modules/.bin"
  "${HOME}/go/bin"
  "${HOME}/.cargo/bin"
  "${HOME}/.joplin-bin/bin/"
  "${HOME}/Library/Python/3.7/bin/"
  "/usr/local/opt/openjdk/bin/"
)

PATH="$(printf "%s:" "${PATHS[@]}")$PATH"


