#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   build new image with development kit layer from an existing image

function errorln() {
  printf "\033[1;32;31m%s\n\033[m" "${1}"
}

function show_usage() {
  cat <<EOF
Usage: $0 [-h|--help] [--basic-image BASIC_IMAGE:TAG] [NEW_IMAGE:TAG]

-h, --help
    Display this help message.

--basic-image BASIC_IMAGE:TAG
    Specify an existing image as a basic image (default: "ubuntu:18.04").

NEW_IMAGE:TAG
    Assign a name to the image (default: "BASIC_IMAGE-dk:TAG").

EOF
}

basic_image_with_tag="ubuntu:18.04"
basic_image="ubuntu"
basic_tag="18.04"
new_image_with_tag=""

## parse arguments
while (($#)); do
  case "$1" in
  -h | --help)
    show_usage
    exit 0
    ;;

  --basic-image)
    if [ -z "$2" ]; then
      errorln "Error: $1 requires a non empty argument" >&2
      show_usage >&2
      exit 1
    else
      basic_image_with_tag="$2"
      # shellcheck disable=SC2001
      basic_image="$(echo "${basic_image_with_tag}" | sed "s/\:.*//")"
      # shellcheck disable=SC2001
      basic_tag="$(echo "${basic_image_with_tag}" | sed "s/.*\://")"
      # shellcheck disable=SC2143
      if [ -z "$(docker images | grep "${basic_image} .*${basic_tag}")" ]; then
        errorln "Error: No such Docker Image: $2" >&2
        show_usage >&2
        exit 1
      fi
      shift 2
    fi
    ;;

  --* | -*)
    errorln "Error: Unknown flag: $1" >&2
    show_usage >&2
    exit 1
    ;;

  *)
    new_image_with_tag="$1"
    shift 1
    ;;
  esac
done
if [ -z "${new_image_with_tag}" ]; then
  new_image_with_tag="${basic_image}-dk:${basic_tag}"
fi

## change Dockerfile
sed -i "s/FROM .*/FROM ${basic_image_with_tag}/g" "${PWD}"/Dockerfile

set -x

docker build -t "${new_image_with_tag}" -f "${PWD}"/Dockerfile "${PWD}"
