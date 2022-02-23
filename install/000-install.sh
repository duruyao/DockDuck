#!/usr/bin/env bash

set -euo pipefail

function traceln() {
  printf "\033[1;36m%s\n\033[m" "${1}"
}

install_dir="$(dirname "$(readlink -f "$0")")"

for file in "${install_dir}"/*.sh; do
  if [ "${file}" != "${install_dir}"/000-install.sh ]; then
    traceln "bash -x ${file}"
    bash -x "${file}"
  fi
done
