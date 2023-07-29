#!/bin/sh
#
# chmodr.sh

usage() {
  echo "Usage: $0 [-d DIRPERMS] [-f FILEPERMS] PATH"
  exit 1
}

# Parse command-line options
while getopts ":d:f:" opt; do
  case "$opt" in
    d)
      DIRPERMS=${OPTARG}
      ;;
    f)
      FILEPERMS=${OPTARG}
      ;;
    \?)
      usage
      ;;
  esac
done
shift $((OPTIND - 1))

# Default directory permissions
DIRPERMS=${DIRPERMS:-755}

# Default file permissions
FILEPERMS=${FILEPERMS:-644}

# Set the root path
ROOT=${1:-'.'}

# Check if the root path is a valid directory
if [ ! -d "$ROOT" ]; then
  echo "$ROOT does not exist or isn't a directory!"
  usage
fi

# Set directory permissions recursively
find "$ROOT" -type d -exec chmod -v "$DIRPERMS" {} +

# Set file permissions recursively
find "$ROOT" -type f -exec chmod -v "$FILEPERMS" {} +
