HOMEBREW_PREFIX=$(brew config |rg HOMEBREW_PREFIX | awk '{ print $2 }')
declare -a PATHS=(
  "$HOMEBREW_PREFIX/bin"
  "$HOMEBREW_PREFXI/opt/ruby"
  "./node_modules/.bin"
  "${HOME}/go/bin"
  "${HOME}/.cargo/bin"
  "${HOME}/.joplin-bin/bin/"
  "${HOME}/Library/Python/3.7/bin/"
  "/usr/local/opt/openjdk/bin/"
)

SPLIT_PATH=($(echo "${PATH}" | tr ":" "\n"))
for DIR in "${SPLIT_PATH[@]}"; do
  PATHS+=("${DIR}")
done

UNIQUE_PATHS=($(for P in "${PATHS[@]}"; do echo "${P}"; done | sort -u))

PATH="$(printf "%s:" "${UNIQUE_PATHS[@]}")"


