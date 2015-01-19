#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install core homebrew packages
brew install grc coreutils spark gcc git

# Install homebrew cask for ui packages
brew install caskroom/cask/brew-cask

# Tap cask versions so we have access to newer packages
brew tap caskroom/versions

# User-defined packages
brew install phantomjs

exit 0
