# dotfiles

This repo contains my dotfiles.

## Installation

### Mac Silicon

Install homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Run the installation script:

```sh
./install_mac.sh
```

Install packages from the `Brewfile`:

```sh
brew bundle --file=~/.Brewfile
```
