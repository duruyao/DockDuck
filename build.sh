#!/usr/bin/env bash

## date:   2022-01-20
## author: duruao@gmail.com
## desc:   build new Docker Image base on an existing Docker Image

function show_usage() {
  cat <<EOF
Usage: $0 [-h|--help] [--basic-image BASIC_IMAGE_REPOSITORY:BASIC_IMAGE_TAG] [NEW_IMAGE_REPOSITORY:NEW_IMAGE_TAG]

-h, --help
    Display this help message.

--basic-image BASIC_IMAGE_REPOSITORY:BASIC_IMAGE_TAG
    An existing Docker Image as basic image (default: "ubuntu:18.04").

NEW_IMAGE_REPOSITORY:NEW_IMAGE_TAG
    New Docker Image (default: "BASIC_IMAGE_REPOSITORY-dk:BASIC_IMAGE_TAG").

EOF
}

basic_image="ubuntu:18.04"
basic_image_repository="ubuntu"
basic_image_tag="18.04"
new_image="ubuntu-dk:18.04"

## parse arguments
while (($#)); do
  case "$1" in
  -h | --help)
    show_usage
    exit 0
    ;;

  --basic-image)
    if [ -z "$2" ]; then
      printf "\033[1;32;31m%s\033[m\n" "Error: $1 requires a non empty argument" >&2
      show_usage >&2
      exit 1
    else
      basic_image="$2"
      # shellcheck disable=SC2001
      basic_image_repository="$(echo "${basic_image}" | sed "s/\:.*//")"
      # shellcheck disable=SC2001
      basic_image_tag="$(echo "${basic_image}" | sed "s/.*\://")"
      # shellcheck disable=SC2143
      if [ -z "$(docker images | grep "${basic_image_repository} .*${basic_image_tag}")" ]; then
        printf "\033[1;32;31m%s\033[m\n" "Error: No such Docker Image: $2" >&2
        show_usage >&2
        exit 1
      fi
      new_image="${basic_image_repository}-dk:${basic_image_tag}"
      sed -i "s/FROM .*/FROM ${basic_image}/g" "${PWD}"/Dockerfile
      shift 2
    fi
    ;;

  --* | -*)
    printf "\033[1;32;31m%s\033[m\n" "Error: Unknown flag: $1" >&2
    show_usage >&2
    exit 1
    ;;

  *)
    new_image="$1"
    ;;
  esac
done

set -x

docker build -t "${new_image}" -f "${PWD}"/Dockerfile "${PWD}"
