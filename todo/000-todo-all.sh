#!/usr/bin/env bash

if [ -n "$(command -v "$0")" ]; then
  todo_dir="$(dirname "$(command -v "$0")")"
else
  todo_dir="$(dirname "$(readlink -f "$0")")"
fi

for file in "${todo_dir}"/*.sh; do
  if [ "${file}" != "${todo_dir}/000-todo-all.sh" ]; then
    printf "\n\033[1;32;34m+ bash -x %s\033[m\n\n" "${file}"
    bash -x "${file}"
  fi
done
