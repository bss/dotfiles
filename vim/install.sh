#!/bin/bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

source "$DOTFILES_ROOT/utils.sh"

brew install macvim
success 'Installing macvim'

