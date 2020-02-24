#!/bin/bash

#------------------------------------------------------------
# This bash script use to render Rmd to HTML, add encryption 
# to some html file and push updates to git.
#------------------------------------------------------------

# Usage: bash update.sh 'message_for_commit'

# Arguments default
msg_flag='no_msg'
msg_flag=$1

echo "============= Rendering =============="
# remove old files
rm -rf ../docs/*
# copy 'www' html files to 'docs'
cp www/* ../docs
# render all the Rmd files to html in /docs
Rscript ./render_rmd2html.R

echo "========= Encrypting test files ========="
# https://github.com/robinmoisson/staticrypt
#rm docs/*_encrypted.html
find ../docs -type f -name "test*.html" -exec staticrypt {} go -f style/pwd_templet.html -t "Take a Test" \;

echo "Encryption is done."

#echo "========= Updates to Github ==========="
# push the updates
#git config --global push.default simple
#git add --all
#git commit -m $msg_flag
#git push