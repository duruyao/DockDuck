#!/usr/bin/env bash

##  Copyright (c) 2022, DURUYAO. All rights reserved.
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##      http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   install dock-duck to the specified directory

set -euo pipefail

function error_ln() {
  printf "\033[1;32;31m%s\n\033[m" "$1"
}

function warning_ln() {
  printf "\033[1;33m%s\n\033[m" "$1"
}

function info_ln() {
  printf "\033[0;32;32m%s\n\033[m" "$1"
}

function show_usage() {
  cat <<EOF
Usage: $0 [OPTIONS]

Install dock-duck to the specified directory

Options:
  -d, --debug                   Install a debug version
  -h, --help                    Display this help message
      --prefix STRING           Specify an installation directory (default: "${HOME}/.duck")

See more about DockDuck at https://github.com/duruyao/DockDuck

EOF
}

prefix="${HOME}/.duck"
debug=false

## parse arguments
while (($#)); do
  case "$1" in
  -d | --debug)
    debug=true
    shift 1
    ;;

  -h | --help)
    show_usage
    exit 0
    ;;

  --prefix)
    if [ -z "$2" ]; then
      error_ln "Error: '$1' requires a non empty argument" >&2
      show_usage >&2
      exit 1
    elif ! [ -d "$2" ]; then
      error_ln "Error: No such directory: '$2'" >&2
      show_usage >&2
      exit 1
    fi
    prefix="$2"
    shift 2
    ;;

  --* | -* | *)
    error_ln "Error: Unknown flag: '$1'" >&2
    show_usage >&2
    exit 1
    ;;
  esac
done

chmod +x "${PWD}"/app/*
chmod +x "${PWD}"/tools/*

dk_home="${prefix}"
dk_app_home="${dk_home}/app"
dk_img_home="${dk_home}/img"
dk_data_home="${dk_home}/data"
dk_tools_home="${dk_home}/tools"

if [ -d "${dk_app_home}" ] || [ -d "${dk_img_home}" ] || [ -d "${dk_tools_home}" ]; then
  warning_ln "Warning: There may already be a dock-duck (v$("${dk_home}"/dk -v | grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+")) in ${dk_home}"
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
mkdir -p "${dk_app_home}"
mkdir -p "${dk_img_home}"
mkdir -p "${dk_data_home}"
mkdir -p "${dk_tools_home}"

cp "${PWD}"/app/* "${dk_app_home}"
cp "${PWD}"/img/* "${dk_img_home}"
cp "${PWD}"/tools/* "${dk_tools_home}"

if ${debug}; then
  rm -f "${dk_app_home}"/*
  ln -s "${PWD}"/app/dk "${dk_app_home}"/dk
  rm -f "${dk_tools_home}"/*
  # shellcheck disable=SC2207
  dk_tools=($(ls ./tools))
  for dk_tool in "${dk_tools[@]}"; do
    ln -s "${PWD}"/tools/"${dk_tool}" "${dk_tools_home}"/"${dk_tool}"
  done
fi

bash_config="
### DockDuck Bash Config Begin
export DK_HOME=\"${dk_home}\" # DockDuck Bash Config
export PATH=\"\$DK_HOME/app:\$PATH\" # DockDuck Bash Config
source \"\$DK_HOME/tools/dk-complete\" # DockDuck Bash Config
### DockDuck Bash Config End
"

echo "${bash_config}" >>"${HOME}"/.bashrc

echo "Install dock-duck to ${dk_home}"
if [ -n "$(command -v tree)" ]; then
  tree "${dk_home}"
else
  ls "${dk_home}"
fi

echo ""
echo "Try 'source ~/.bashrc' to reload PATH"
