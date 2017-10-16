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


brew install imagemagick@6 ghostscript phantomjs graphicsmagick poppler ghostscript tesseract lbzip2
success 'Installing dependencies'

curl -sL -o ~/Downloads/pdftk.pkg https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg
sudo installer -pkg ~/Downloads/pdftk.pkg -target /
success 'Installing pdftk'

brew link imagemagick@6 --force # rmagick gem only works with 6
success 'Linking correct version of imagemagick'

sudo brew services start mysql
success 'Starting mysql'

sudo brew services start redis
success 'Starting redis'


setup_host_in_hosts_file 'zenpayroll.dev'
setup_host_in_hosts_file 'manage.zenpayroll.dev'
setup_host_in_hosts_file 'app.zenpayroll.dev'
setup_host_in_hosts_file 'api.zenpayroll.dev'
setup_host_in_hosts_file 'internal-api.zenpayroll.dev'
setup_host_in_hosts_file 'hippo.zenpayroll.dev'
setup_host_in_hosts_file 'gusto.dev'
setup_host_in_hosts_file 'manage.gusto.dev'
setup_host_in_hosts_file 'app.gusto.dev'
setup_host_in_hosts_file 'api.gusto.dev'
setup_host_in_hosts_file 'internal-api.gusto.dev'
setup_host_in_hosts_file 'hippo.gusto.dev'

