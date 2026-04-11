# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A personal dotfiles repository for macOS (Apple Silicon). Config files are symlinked into `$HOME` rather than copied.

## Setup

Run `./setup.sh` to install all Homebrew dependencies (CLI tools and cask apps). Then manually create symlinks:

```sh
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zsh_plugins.txt ~/.zsh_plugins.txt
```

The `.zsh_plugins.txt` file (not tracked here — lives in `$HOME`) defines plugins for [antidote](https://getantidote.github.io/), which auto-compiles them to `~/.zsh_plugins.zsh` on first load.

## Key Files

| File | Purpose |
|------|---------|
| `zshrc` | Shell config: antidote plugins, aliases, lazy NVM, fzf, zoxide, direnv |
| `tmux.conf` | Tmux config: prefix is `Ctrl-z`, vim-style pane navigation, mouse on |
| `gitconfig` | Git config: delta pager, conditional includes per work context, aliases |
| `setup.sh` | Idempotent Homebrew installer for all tools and casks |

## Architecture Notes

- **Plugin manager**: antidote (Homebrew). Plugins defined in `~/.zsh_plugins.txt`, compiled to `~/.zsh_plugins.zsh`. Regenerated automatically when `.txt` is newer than `.zsh`.
- **zshrc ordering matters**: tmux auto-attach must come before the Powerlevel10k instant prompt block; anything that writes to stdout before the p10k block will break instant prompt.
- **NVM is lazy-loaded**: `nvm`, `node`, `npm`, `npx` are stub functions that load the real NVM on first call to keep shell startup fast.
- **Git identity is context-aware**: `gitconfig` uses `includeIf "gitdir:..."` to switch email/name based on project directory (personal, bancolombia, tw, ipsos).
- **delta is the git pager**: side-by-side diff view is enabled; `delta` must be installed (`brew install git-delta`).
- **atuin is commented out**: shell history sync via atuin is disabled in `zshrc` — uncomment the `atuin init` line to enable.
