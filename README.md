# dTask Homebrew Tap

Homebrew tap for [dTask](https://github.com/ltnproject/dtask) — Apple Silicon system monitor with liquid glass UI.

## Install

### One command (fresh install):
```bash
brew install ltnproject/dtask/dtask
```

### Or tap first, then install:
```bash
brew tap ltnproject/dtask
brew install dtask
```

After install, dTask is placed in `~/Applications/dTask.app` with quarantine automatically removed.

Launch with:
```bash
open ~/Applications/dTask.app
# or
dtask
```

## Requirements

- **Apple Silicon** (M1 / M2 / M3 / M4 or later)
- **macOS 14 Sonoma** or **macOS 15 Sequoia**

## Update

```bash
brew update
brew upgrade dtask
```

## Uninstall

```bash
brew uninstall dtask
rm -rf ~/Applications/dTask.app
```

## Project

→ [github.com/ltnproject/dtask](https://github.com/ltnproject/dtask)
