#!/bin/sh

if test ! $(which node)
then
  echo "  Installing node for you."
  brew install node > /tmp/node-install.log
fi

if test ! $(which yarn)
then
  echo "  Installing yarn you."
  brew install yarn > /tmp/node-install.log
fi
