#!/bin/sh
#
# SSH Config
#
# This installs a nice SSH config

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)
SSH_DIR="$HOME/.ssh"

set -e

echo ''

echo 'Creating tmp dir for ssh'
mkdir -p "$SSH_DIR/tmp" || true

echo 'Linking ssh config'
ln -s "$DOTFILES_ROOT/ssh/ssh_config" "$SSH_DIR/config"

exit 0

