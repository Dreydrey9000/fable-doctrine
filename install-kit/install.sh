#!/bin/bash
# Fable Doctrine — one-command installer (the email-bonus shortcut).
# Drops the doctrine into ~/.claude and wires it to load on every Claude Code
# session, on every model. Safe: never overwrites silently, only appends the
# import if it's missing. ~30 seconds.
set -euo pipefail

CLAUDE_DIR="${CLAUDE_DIR:-$HOME/.claude}"
RULES_DIR="$CLAUDE_DIR/rules"
DOCTRINE="$RULES_DIR/fable-doctrine.md"
CLAUDEMD="$CLAUDE_DIR/CLAUDE.md"
IMPORT_LINE="@rules/fable-doctrine.md"
RAW="https://raw.githubusercontent.com/Dreydrey9000/fable-doctrine/main/FABLE-DOCTRINE.md"

echo "Installing the Fable Doctrine into $CLAUDE_DIR ..."
mkdir -p "$RULES_DIR"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$RAW" -o "$DOCTRINE"
else
  echo "curl not found — download $RAW manually into $DOCTRINE"; exit 1
fi
echo "  wrote $DOCTRINE"

touch "$CLAUDEMD"
if grep -qF "$IMPORT_LINE" "$CLAUDEMD"; then
  echo "  import already present in CLAUDE.md — leaving it"
else
  printf '\n## The Fable Doctrine (always on)\n%s\n' "$IMPORT_LINE" >> "$CLAUDEMD"
  echo "  added the import to $CLAUDEMD"
fi

echo ""
echo "Done. Open a new Claude Code session, run /memory, and confirm the doctrine loaded."
echo "Then ask the model to quote pillar 1 (Relentless Resourcefulness)."
