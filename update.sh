#!/bin/bash

# print_usage function
print_usage() {
  printf "Usage: bash update.sh -m 'message for commit' \n\n"
  printf "    -m: message for commit \n\n"
}

# Arguments default
msg_flag='no_msg'

# get arguments
while getopts 'm:' flag; do
  case "${flag}" in
  m) msg_flag="${OPTARG}";;
  *)
    print_usage
    exit 1
    ;;
  esac
done

#echo $msg_flag

# render all the Rmd files to html in /docs
Rscript ./render_rmd2html.R

echo "Rendering Done. Pushing the updates to github."

# push the updates
git config --global push.default simple
git add --all
git commit -a -m $msg_flag
git push