#!/bin/bash

# Install powerline fonts
cd "$(dirname "$0")/../fonts"

set -e

echo ''

echo 'Instaling fonts'
exec ./fonts/install.sh

