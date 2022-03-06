#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   uninstall dock-duck to the specified directory

set -euo pipefail

function errorln() {
  printf "\033[1;32;31m%s\n\033[m" "${1}"
}

function show_usage() {
  cat <<EOF
Usage: $0 [OPTIONS]

Uninstall dock-duck from \$DK_HOME

Options:
  -h, --help                    Display this help message

See more about DockDucK at https://github.com/duruyao/DockDucK

EOF
}

## parse arguments
while (($#)); do
  case "$1" in
  -h | --help)
    show_usage
    exit 0
    ;;

  --* | -* | *)
    errorln "Error: Unknown flag: $1" >&2
    show_usage >&2
    exit 1
    ;;
  esac
done

echo "Uninstalling ..."
echo

# shellcheck disable=SC2153
dk_home="${DK_HOME}"

rm -f "${dk_home}"/dk
rm -rf "${dk_home}"/dk-tools
rm -rf "${dk_home}"/dk-data

sed -i "/.*DK_HOME.*/d" "${HOME}"/.bashrc

source "${HOME}"/.bashrc

echo "Uninstall dock-duck from ${dk_home}"
