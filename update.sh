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

echo "============= Rendering =============="
# render all the Rmd files to html in /docs
Rscript ./render_rmd2html.R

echo "========= Encrypting test files ========="
# https://github.com/robinmoisson/staticrypt
rm docs/*_encrypted.html
find . -type f -name "test*.html" -exec staticrypt {} go -f style/pwd_templet.html \;

echo "========= Updates to Github ==========="


# push the updates
git config --global push.default simple
git add --all
git commit -a -m $msg_flag
git push