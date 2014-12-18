#!/bin/sh

if test ! $(which node)
then
  echo "  Installing node for you."
  brew install node > /tmp/node-install.log
fi
