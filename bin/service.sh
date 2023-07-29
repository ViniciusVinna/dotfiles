#!/usr/bin/env bash

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Please install Homebrew before using this script."
  exit 1
fi

# Handle different command cases
case "$1" in
  start | stop | restart)
    if [ "$#" -ne 2 ]; then
      echo "Usage: service [daemon] [start|stop|restart]"
      exit 1
    fi
    brew services "$2" "$1"
    ;;
  list)
    brew services list
    ;;
  *)
    echo "Usage: service [daemon] [start|stop|restart] or service list to see all the daemons"
    exit 1
    ;;
esac
