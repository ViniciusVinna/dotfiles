#!/usr/bin/env bash

# Define colors using tput for portability
cyan=$(tput setaf 6)
reset=$(tput sgr0)

# Set default values for options
dir='.'
sensitive=
colors=
linenums=1
maxdepth=

# Usage info
function usage {
  cat <<EOF
Usage: search [options] [directory] [term ...]

Options:
  -s, --sensitive       Force case sensitive search.
  -i, --insensitive     Force case insensitive search.
  -d, --max-depth       Limit recursion.
  -C, --no-colors       Force avoid colors.
  -L, --no-linenums     Hide line numbers.
  -h, --help            Show this message.

EOF
}

# Parse options
while [[ "$1" =~ "-" ]]; do
  case $1 in
    -s | --sensitive)
      sensitive=1
      ;;
    -i | --insensitive)
      sensitive=
      ;;
    -C | --no-colors)
      colors=
      ;;
    -L | --no-linenums)
      linenums=
      ;;
    -d | --max-depth)
      maxdepth=$2
      shift
      ;;
    -h | --help)
      usage
      exit
      ;;
    *)
      echo "Invalid option: $1"
      usage
      exit 1
      ;;
  esac
  shift
done

if [ "$maxdepth" ]; then
  maxdepth="-maxdepth $maxdepth"
fi

# Check for directory as the first parameter
if [[ "$1" =~ / ]]; then
  if [ -d "$1" ]; then
    dir=$(echo "$1" | sed "s/\/$//")
    shift
  fi
fi

# Check for empty search
if [[ "$#" == 0 ]]; then
  echo "(no search term. Use 'search -h' for usage)"
  exit 1
fi

# Auto-detect case sensitive based on an uppercase letter
if [[ "$@" =~ [A-Z] ]]; then
  sensitive=1
fi

# Set grep options
grepopt="--binary-files=without-match --devices=skip"

# Add case insensitive search
if [ ! "$sensitive" ]; then
  grepopt="$grepopt --ignore-case"
fi

# Add line number options
if [ "$linenums" ]; then
  grepopt="$grepopt -n"
fi

# Add force colors
if [ "$colors" ] && [ -t 1 ]; then
  grepopt="$grepopt --color=always"
fi

# Run search
find "$dir" -type f $maxdepth ! -path '*/.git*' ! -path '*/.svn' -print0 \
  | xargs -0 grep "$grepopt" "$@" \
  | sed "s/^\([^:]*:\)\(.*\)/  $cyan\1$reset  \2 /"

echo ""
