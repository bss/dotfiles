#!/bin/sh
#
# GUI Apps
#
# This installs common GUI apps using homebrew cask

# Install a cask if it is not already installed. 
# Updates should be done through "brew cask update"
function cask_install () {
	brew cask info "$1" | grep -i "not installed" > /dev/null
	if [ $? -ne 0 ]; then
		echo "$1 is already installed"
	else
		brew cask install --force --appdir="/Applications" "$1"
	fi
}

# Browsers
cask_install "google-chrome"
cask_install "google-chrome-canary"
cask_install "firefox"

# Development & editors
cask_install "sublime-text3"
cask_install "sourcetree"
cask_install "vagrant"
cask_install "virtualbox"

# Productivity & tools
cask_install "evernote"
cask_install "iterm2"
cask_install "skype"
cask_install "dropbox"

# Media
cask_install "vlc"

exit 0

