#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   install dock-duck to the specified directory

set -euo pipefail

function errorln() {
  printf "\033[1;32;31m%s\n\033[m" "${1}"
}

function show_usage() {
  cat <<EOF
Usage: $0 [OPTIONS]

Install dock-duck to the specified directory

Options:
  -h, --help                    Display this help message
      --prefix STRING           Specify an installation directory (default: "${HOME}/.dock-duck/bin")

See more about DockDucK at https://github.com/duruyao/DockDucK

EOF
}

dk_home="${HOME}/.dock-duck"
prefix="${dk_home}/bin"
mkdir -p "${prefix}"

## parse arguments
while (($#)); do
  case "$1" in
  -h | --help)
    show_usage
    exit 0
    ;;

  --prefix)
    if [ -z "$2" ]; then
      errorln "Error: $1 requires a non empty argument" >&2
      show_usage >&2
      exit 1
    elif [ ! -d "$2" ]; then
      errorln "Error: No such directory: $2" >&2
      show_usage >&2
      exit 1
    fi
    prefix="$2"
    shift 2
    ;;

  --* | -* | *)
    errorln "Error: Unknown flag: $1" >&2
    show_usage >&2
    exit 1
    ;;
  esac
done

echo "Installing ..."
echo

chmod +x "${PWD}"/apps/*
cp "${PWD}"/apps/* "${prefix}"/
cp "${PWD}"/tools/* "${dk_home}"/

line="export PATH=\"${prefix}:\$PATH\""
if ! grep -Fxq "${line}" "${HOME}"/.bashrc; then
  echo "${line}" >>"${HOME}"/.bashrc
fi
source "${HOME}"/.bashrc

echo "Install dock-duck to ${prefix}"
if [ -n "$(command -v tree)" ]; then
  tree "${prefix}"
else
  ls "${prefix}"
fi
