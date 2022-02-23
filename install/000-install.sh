#!/usr/bin/env bash

if [ -n "$(command -v "$0")" ]; then
  install_dir="$(dirname "$(command -v "$0")")"
else
  install_dir="$(dirname "$(readlink -f "$0")")"
fi

for file in "${install_dir}"/*.sh; do
  if [ "${file}" != "${install_dir}/000-install-list.sh" ]; then
    printf "\n\033[1;32;34m%s\033[m\n\n" "bash -x ${file}"
    bash -x "${file}"
  fi
done
