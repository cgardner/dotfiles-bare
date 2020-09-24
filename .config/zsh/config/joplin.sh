joplin-export() {
  NAME=$1
  joplin cat "$1" | tail -n +2 | pandoc --defaults ~/.config/pandoc/defaults.yaml --filter pandoc-plantuml -o ~/Downloads/${NAME// /-}.pdf
}
