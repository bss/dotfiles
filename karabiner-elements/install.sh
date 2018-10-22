#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

source "$DOTFILES_ROOT/utils.sh"

cask_install "karabiner-elements"

launchctl load -w /Library/LaunchAgents/org.pqrs.karabiner.karabiner_console_user_server.plist
success "Enabled and started karabiner"

