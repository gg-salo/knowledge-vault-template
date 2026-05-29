#!/bin/bash
# SessionStart hook — refresh the QMD vault index in the background.
# Non-blocking: detaches and returns immediately so the session starts fast.
# Skips gracefully if qmd isn't installed yet (run `set up vault tooling` first).

# Locate qmd (hook env may lack the nvm/npm-global PATH)
QMD="$(command -v qmd 2>/dev/null)"
if [ -z "$QMD" ]; then
  for d in "$HOME"/.nvm/versions/node/*/bin; do
    [ -x "$d/qmd" ] && QMD="$d/qmd" && break
  done
fi
[ -z "$QMD" ] && exit 0   # qmd not installed yet — do nothing, cleanly

# Detach: refresh index without blocking the session
nohup bash -c "\"$QMD\" update && \"$QMD\" embed" > "$HOME/.qmd-session.log" 2>&1 &

exit 0
