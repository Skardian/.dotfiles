# fe [FUZZY PATTERN] - Open the selected file with the default editor
# Source: https://github.com/atweiden/fzf-extras
#   - CTRL-O to open with `xdg-open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
#   - Exit if there's no match (--exit-0)
fo() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && ${EDITOR:-vim} "$file" || xdg-open "$file"
  fi
}
