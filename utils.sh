#!/usr/bin/env bash

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

validation_prompt() {
  confirm=''

  until [[ $confirm =~ [Yy] ]]; do
    echo "${1:-Ready to continue?}[y/N]"
    read confirm
  done
}

cask_install() {
  echo "dafuk?"
	if ! brew cask info "$1" | grep -i "not installed" > /dev/null; then
#	if [ $? -ne 0 ]; then
		info "$1 is already installed"
	else
	  brew cask install "$1"
    success "Installed $1"
	fi
}

