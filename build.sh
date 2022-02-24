#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   build a new dock-duck image with one more development kit layer than the base image

set -euo pipefail

function errorln() {
  printf "\033[1;32;31m%s\n\033[m" "${1}"
}

function show_usage() {
  cat <<EOF
Usage: $0 [OPTIONS] IMAGE

Build a new dock-duck image with one more development kit layer than the base image

Options:
  -h, --help                    Display this help message
      --name STRING             Assign a name to the new image (default: "IMAGE-dk:TAG")

See more about DockDucK at https://github.com/duruyao/DockDucK

EOF
}

image=""
name=""

## parse arguments
while (($#)); do
  case "$1" in
  -h | --help)
    show_usage
    exit 0
    ;;

  --name)
    name="$2"
    shift 2
    ;;

  --* | -*)
    errorln "Error: Unknown flag: $1" >&2
    show_usage >&2
    exit 1
    ;;

  *)
    # shellcheck disable=SC2001
    repo="$(echo "$1" | sed "s/\:.*//")"
    # shellcheck disable=SC2001
    tag="$(echo "$1" | sed "s/.*\://")"
    # shellcheck disable=SC2143
    if [ -z "$(docker images | grep "${repo} .*${tag}")" ]; then
      errorln "Error: No such docker image: $1" >&2
      show_usage >&2
      exit 1
    fi
    image="$1"
    if [ -z "${name}" ]; then
      name="${repo}-dk:${tag}"
    fi
    shift 1
    ;;
  esac
done

if [ -z "${image}" ]; then
  errorln "Error: Missing IMAGE" >&2
  show_usage >&2
  exit 1
fi

## change Dockerfile
sed -i "s/FROM .*/FROM ${image}/g" "${PWD}"/Dockerfile

set -x
docker build -t "${name}" -f "${PWD}"/Dockerfile "${PWD}"
