#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   install tools of DockerDK

function show_usage() {
  cat <<EOF
Usage: $0 [-h|--help] [--prefix PREFIX]

-h, --help
    Display this help message.

--prefix PREFIX
    Specify an installation directory (default: "/usr/local/bin").

EOF
}

prefix="/usr/local/bin"

## parse arguments
while (($#)); do
  case "$1" in
  -h | --help)
    show_usage
    exit 0
    ;;

  --prefix)
    if [ -z "$2" ]; then
      printf "\033[1;32;31m%s\033[m\n" "Error: $1 requires a non empty argument" >&2
      show_usage >&2
      exit 1
    elif [ ! -d "$2" ]; then
      printf "\033[1;32;31m%s\033[m\n" "Error: No such directory: $2" >&2
      show_usage >&2
      exit 1
    else
      prefix="$2"
      shift 2
    fi
    ;;

  --* | -* | *)
    printf "\033[1;32;31m%s\033[m\n" "Error: Unknown flag: $1" >&2
    show_usage >&2
    exit 1
    ;;
  esac
done

set -x

chmod +x "${PWD}"/tools/*

cp "${PWD}"/tools/* "${prefix}"/
