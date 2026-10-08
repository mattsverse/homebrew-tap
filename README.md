# Mattsverse Homebrew Tap

Install Octowatcher on macOS (Apple silicon and Intel):

```sh
brew install --cask mattsverse/tap/octowatcher
gh auth login --hostname github.com
```

Open **Octowatcher** from Applications. The cask installs GitHub CLI as a
dependency; signing in is a separate step.

Octowatcher can update itself. To update through Homebrew instead, quit the app
and run:

```sh
brew update
brew upgrade --cask --greedy mattsverse/tap/octowatcher
```

The Octowatcher release workflow updates `Casks/octowatcher.rb` after publishing
the signed and notarized universal DMG. Setup and recovery instructions live in
[Octowatcher's Homebrew guide](https://github.com/mattsverse/octowatch/blob/main/packaging/homebrew/README.md).
