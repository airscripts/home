#!/bin/bash
set -e

if [ "$1" = 'hugo' ]; then
  hugo server --bind $HOME_INTERFACE --port $HOME_PORT

else 
  exec "$@"
fi