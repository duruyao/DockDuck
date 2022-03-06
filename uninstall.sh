#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   uninstall dock-duck from $DK_HOME

set -euo pipefail

function errorln() {
  printf "\033[1;32;31m%s\n\033[m" "${1}"
}

function warningln() {
  printf "\033[1;33m%s\n\033[m" "${1}"
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

if [ -z "${DK_HOME}" ]; then
  warningln "Warning: \$DK_HOME not found"
  exit
fi

# shellcheck disable=SC2153
dk_home="${DK_HOME}"
dk_data_home="${dk_home}/dk-data"
dk_tools_home="${dk_home}/dk-tools"

rm -f "${dk_home}"/dk
rm -rf "${dk_data_home}"
rm -rf "${dk_tools_home}"

line="export DK_HOME=.*"
sed -i "/${line}/d" "${HOME}"/.bashrc

line="export PATH=\"\$DK_HOME:\$PATH\""
sed -i "/${line}/d" "${HOME}"/.bashrc

source "${HOME}"/.bashrc

echo "Uninstall dock-duck from ${dk_home}"
