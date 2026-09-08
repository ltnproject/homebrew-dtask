# dTask Homebrew Tap

Homebrew tap for [dTask](https://github.com/ltnproject/dtask) — Apple Silicon system monitor.

## Install

```bash
brew install ltnproject/dtask/dtask
```

That's it. Homebrew will:
1. Download `dTask.app`
2. Copy it to `/Applications/dTask.app`
3. Automatically remove the macOS quarantine attribute

## Or tap first, then install

```bash
brew tap ltnproject/dtask
brew install dtask
```

## Requirements

- Apple Silicon (M1 / M2 / M3 / M4 or later)
- macOS 14 Sonoma or macOS 15 Sequoia

## Update

```bash
brew update
brew upgrade dtask
```

## Uninstall

```bash
brew uninstall dtask
sudo rm -rf /Applications/dTask.app
```

## Project

→ [github.com/ltnproject/dtask](https://github.com/ltnproject/dtask)
