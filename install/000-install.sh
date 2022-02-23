#!/usr/bin/env bash

install_dir="$(dirname "$(readlink -f "$0")")"

for file in "${install_dir}"/*.sh; do
  if [ "${file}" != "${install_dir}"/000-install.sh ]; then
    printf "\n\033[1;32;34m%s\033[m\n\n" "bash -x ${file}"
    bash -x "${file}"
  fi
done
