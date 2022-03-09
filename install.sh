#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   install dock-duck to the specified directory

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

Install dock-duck to the specified directory

Options:
  -h, --help                    Display this help message
      --prefix STRING           Specify an installation directory (default: "${HOME}/.duck")

See more about DockDucK at https://github.com/duruyao/DockDucK

EOF
}

prefix="${HOME}/.duck"

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

chmod +x "${PWD}"/app/*
chmod +x "${PWD}"/tools/*

dk_home="${prefix}"
dk_data_home="${dk_home}/dk-data"
dk_tools_home="${dk_home}/dk-tools"

if [ -f "${dk_home}/dk" ] || [ -d "${dk_data_home}" ] || [ -d "${dk_tools_home}" ]; then
  warningln "Warning: There may already be a dock-duck ($("${dk_home}"/dk -v | sed "s/.* //")) in ${dk_home}"
  # shellcheck disable=SC2162
  read -p "Do you want to continue installing the current version? [Y/n] " install_dk
  # shellcheck disable=SC2143
  if [ -n "$(echo "${install_dk}" | grep -E "n|no|N|No|NO")" ]; then
    exit
  fi
  echo ""
fi

echo "Installing ..."
echo

mkdir -p "${dk_home}"
mkdir -p "${dk_data_home}"
mkdir -p "${dk_tools_home}"

cp "${PWD}"/app/* "${dk_home}"/
cp "${PWD}"/tools/* "${dk_tools_home}"/

line="export DK_HOME=\"${dk_home}\""
if ! grep -Fxq "${line}" "${HOME}"/.bashrc; then
  echo "${line}" >>"${HOME}"/.bashrc
fi

line="export PATH=\"\$DK_HOME:\$PATH\""
if ! grep -Fxq "${line}" "${HOME}"/.bashrc; then
  echo "${line}" >>"${HOME}"/.bashrc
fi

source "${HOME}"/.bashrc

echo "Install dock-duck to ${dk_home}"
if [ -n "$(command -v tree)" ]; then
  tree "${dk_home}"
else
  ls "${dk_home}"
fi
