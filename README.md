# dTask Homebrew Tap

Official Homebrew tap for [dTask](https://github.com/ltnproject/dtask) — Apple Silicon system monitor with cute liquid glass design.

## Installation

### Method 1: Direct one-liner (new users)

```bash
brew install ltnproject/dtask/dtask
```
*(or `brew install ltnproject/dtask/dTask`)*

---

### Method 2: Tap then install

```bash
brew tap ltnproject/dtask
brew install dtask
```
*(or `brew install dTask`)*

---

## What Happens Automatically

1. 📦 Downloads `dTask-1.0.0.zip` from GitHub Releases
2. 🚀 Copies `dTask.app` to `/Applications/dTask.app`
3. 🛡️ Automatically strips the macOS quarantine attribute (`xattr -r -d com.apple.quarantine /Applications/dTask.app`)
4. ⚡ Creates `dtask` CLI launcher in your `$PATH`

You can launch it immediately:

```bash
open /Applications/dTask.app
# or
dtask
```

## Updating

```bash
brew update
brew upgrade dtask
```

## Uninstalling

```bash
brew uninstall dtask
rm -rf /Applications/dTask.app
```

## Requirements

- **Apple Silicon** (M1 / M2 / M3 / M4 or later)
- **macOS 14 Sonoma** or **macOS 15 Sequoia**

---

**Repository:** [github.com/ltnproject/dtask](https://github.com/ltnproject/dtask)
