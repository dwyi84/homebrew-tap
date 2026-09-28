# Homebrew Tap

Personal [Homebrew](https://brew.sh) tap for [dwyi84](https://github.com/dwyi84)'s apps.

## NightOwl

A featherweight macOS menu bar utility that keeps your Mac awake with a single `IOPMAssertion`.

```bash
brew tap dwyi84/tap
brew install --cask nightowl
```

NightOwl installs to `~/Applications/NightOwl.app`. Because it is signed with a
local certificate rather than notarized by Apple, Gatekeeper blocks the first
launch — right-click the app and choose **Open**, or clear the quarantine flag:

```bash
xattr -dr com.apple.quarantine "$HOME/Applications/NightOwl.app"
```

### Uninstall

```bash
brew uninstall --cask nightowl
brew uninstall --zap --cask nightowl   # also remove preferences
```

NightOwl is Apple Silicon only and requires macOS 14 (Sonoma) or later.
