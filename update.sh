#!/bin/bash

# Arguments default
use_flag='no msg'

print_usage() {
  printf "Usage: bash update.sh -m 'message for commit' \n\n"
  printf "    -m: message for commit \n\n"
}

while getopts 'm:' flag; do
  case "${flag}" in
  m) use_flag="${OPTARG}" ;;
  *)
    print_usage
    exit 1
    ;;
  esac
done

RScript render_rmd2html.R

git add .
git commit -m commit 