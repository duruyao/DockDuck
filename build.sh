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
      --name STRING             Assign a name to the new image (default: "IMAGE:TAG-dk")

See more about DockDucK at https://github.com/duruyao/DockDucK

EOF
}

image=""
name=""

if [ -z "$(command -v docker)" ]; then
  errorln "Error: Command 'docker' not found, try: sudo apt install <deb name>" >&2
  show_usage >&2
  exit 1
fi

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
    repo="${1//\:*/}"
    tag="${1//*\:/}"
    if ! echo "$1" | grep -q ":"; then
      tag="latest"
    fi
    if ! docker images | grep -q "${repo} .*${tag}"; then
      errorln "Error: No such docker image: $1" >&2
      show_usage >&2
      exit 1
    fi
    image="$1"
    if [ -z "${name}" ]; then
      name="${repo}:${tag}-dk"
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
sed -i "/FROM .*/d" "${PWD}"/Dockerfile
sed -i "1i FROM ${image}" "${PWD}"/Dockerfile

set -x
docker build -t "${name}" -f "${PWD}"/Dockerfile "${PWD}"
