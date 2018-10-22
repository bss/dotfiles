#!/usr/bin/env bash
#
# GUI Apps
#
# This installs common GUI apps using homebrew cask

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

source "$DOTFILES_ROOT/utils.sh"

# Install a cask if it is not already installed. 
# Updates should be done through "brew cask update"

# Browsers
#cask_install "google-chrome"
#cask_install "google-chrome-canary"
#cask_install "firefox"

# Development & editors
cask_install "atom"
#cask_install "sublime-text3"
#cask_install "sourcetree"
#cask_install "vagrant"
#cask_install "virtualbox"
#cask_install "chefdk"

# Productivity & tools
#cask_install "evernote"
#cask_install "iterm2"
#cask_install "skype"
#cask_install "dropbox"
#cask_install "hipchat"
#cask_install "slack"
#cask_install "google-drive"
cask_install "flux"

cask_install "spotify"

cask_install "sequel-pro"

# Media
#cask_install "vlc"

exit 0

