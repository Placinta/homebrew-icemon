# Homebrew icemon

Provides a build-from-source homebrew Formula for icemon (icecc), which actually works, as opposed to the upstream version (Fixes hosts not showing up bug).

Note that the formula uses the v3.2.0 source archive, instead of HEAD, because at the time of writing HEAD of the repo doesn't build on macOS (due to using extra-cmake-modules).

Tested on macOS 10.14.1, Xcode 10.1, brew-installed icecc version 1.2.

## Installation

```
brew install alcroito/icemon/icemon
```

or

```
brew tap alcroito/icemon
brew tap-pin alcroito/icemon
brew install icemon
```

## Usage

Run `icemon`.
