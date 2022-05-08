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

See more about DockDuck at https://github.com/duruyao/DockDuck

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
    if [ -z "$(docker images -q "${repo}:${tag}")" ]; then
      errorln "Error: No such docker image: '${repo}:${tag}'" >&2
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
