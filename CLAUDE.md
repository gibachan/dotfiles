# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

```sh
# Symlink dotfiles to home directory
./link.sh

# Install all Homebrew packages and casks
brew bundle
```

`link.sh` creates symlinks: `~/.zshrc`, `~/.gitconfig`, `~/.gitignore_global` → `~/dotfiles/`.

## Repository Structure

- `.zshrc` — Shell configuration: prompt, aliases, PATH setup for Android SDK, asdf, mint, nest, SDKMAN
- `.gitconfig` — Git user config and aliases (`g`, `s`, `ss`, `co`, `lg`, `br`, `pr`)
- `Brewfile` — Homebrew formulae and casks for macOS setup
- `link.sh` — Symlink script for dotfiles installation
- `install-intelligence.sh` — Installs AI tool skills/commands to their respective destinations
- `intelligence/` — AI tool configurations
  - `claude/skills/koba-review/SKILL.md` — Custom `/koba-review` skill for iOS code review (Swift-focused, outputs in Japanese for `commit` subcommand)
  - `gemini/commands/` — Gemini CLI custom command definitions (`.toml`)

## Key Tools Managed

- **asdf** — Runtime version manager (loaded in `.zshrc`)
- **mint** — Swift package manager for CLI tools
- **ghq + peco** — Repository management (`g` alias navigates repos interactively)
- **mise** — Polyglot tool version manager

## Custom Skill: koba-review

The `intelligence/claude/skills/koba-review/SKILL.md` defines a Claude Code skill for iOS/Swift code review:

- `/koba-review branch <target> [base]` — Diffs two branches (default base: `develop`), reviews for Swift idioms, memory management, architecture, concurrency, robustness
- `/koba-review commit` — Reviews the latest commit focusing on memory leaks, deprecated APIs, technical debt; **outputs in Japanese**
