#!/bin/bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

source "$DOTFILES_ROOT/utils.sh"

setup_host_in_hosts_file() {
  if test ! $(grep "127.0.0.1 $1" /etc/hosts)
  then
    echo "127.0.0.1 $1" | sudo tee -a /etc/hosts
    success "Pointing $1 at localhost using /etc/hosts"
  fi
}

setup_host_in_hosts_file 'gusto-dev.com'
setup_host_in_hosts_file 'manage.gusto-dev.com'
setup_host_in_hosts_file 'app.gusto-dev.com'
setup_host_in_hosts_file 'api.gusto-dev.com'
setup_host_in_hosts_file 'internal-api.gusto-dev.com'
setup_host_in_hosts_file 'hippo.gusto-dev.com'


brew cask list | egrep 'java$' >/dev/null || brew cask install java
brew cask install homebrew/cask-versions/java8
brew install imagemagick@6 ghostscript graphicsmagick poppler ghostscript tesseract lbzip2 elasticsearch mysql@5.7 redis nvm
brew cask install phantomjs
success 'Installing dependencies'

curl -sL -o ~/Downloads/pdftk.pkg https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg
sudo installer -pkg ~/Downloads/pdftk.pkg -target /
success 'Installing pdftk'

brew link imagemagick@6 --force # rmagick gem only works with 6
success 'Linking correct version of imagemagick'

brew link mysql@5.7 --force # Rails4-compatible mysql2 gem only works with <= 5.7
success 'Linking correct version of mysql'

sudo brew services start mysql
success 'Starting mysql'

sudo brew services start redis
success 'Starting redis'

source "/usr/local/opt/nvm/nvm.sh"
nvm install "$(nvm ls-remote | tail -n 1 | tr -d '[:space:]')"
success 'Installed latest node version'

setup_host_in_hosts_file 'gusto-dev.com'
setup_host_in_hosts_file 'manage.gusto-dev.com'
setup_host_in_hosts_file 'app.gusto-dev.com'
setup_host_in_hosts_file 'api.gusto-dev.com'
setup_host_in_hosts_file 'internal-api.gusto-dev.com'
setup_host_in_hosts_file 'hippo.gusto-dev.com'

