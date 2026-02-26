#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Claude Code skills
CLAUDE_SKILLS_SRC="$SCRIPT_DIR/intelligence/claude/skills"
CLAUDE_SKILLS_DEST="$HOME/.claude/skills"

mkdir -p "$CLAUDE_SKILLS_DEST"

# Remove existing koba-* skills
for d in "$CLAUDE_SKILLS_DEST"/koba-*; do
  [ -e "$d" ] && rm -rf "$d"
done

# Copy skills
for src in "$CLAUDE_SKILLS_SRC"/koba-*; do
  [ -d "$src" ] && cp -r "$src" "$CLAUDE_SKILLS_DEST/"
done

echo "Claude skills installed to $CLAUDE_SKILLS_DEST"

# Gemini commands
GEMINI_COMMANDS_SRC="$SCRIPT_DIR/intelligence/gemini/commands"
GEMINI_COMMANDS_DEST="$HOME/.gemini/commands"

mkdir -p "$GEMINI_COMMANDS_DEST"

# Remove existing koba-* commands
for f in "$GEMINI_COMMANDS_DEST"/koba-*; do
  [ -e "$f" ] && rm -f "$f"
done

# Copy commands
for src in "$GEMINI_COMMANDS_SRC"/koba-*; do
  [ -f "$src" ] && cp "$src" "$GEMINI_COMMANDS_DEST/"
done

echo "Gemini commands installed to $GEMINI_COMMANDS_DEST"
