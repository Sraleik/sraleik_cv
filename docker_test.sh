#!/bin/bash

function version2 { echo "$@" | gawk -F. '{ printf("%03d%03d\n", $1,$2); }'; }
function version3 { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }

git_version=`git --version | head -n1 | cut -d" " -f3`
curl_version=`curl --version | head -n1 | cut -d" " -f2`
vim_tiny_version=`vim.tiny --version | head -n1 | cut -d" " -f5`
node_version=`node --version | cut -d"v" -f2`
npm_version=`npm --version`

if [ "$(version3 "$git_version")" -gt "$(version3 "2.7.0")" ]; then
  echo "---git---"
  echo "$git_version is greater than 2.7.0 !"
  echo " "
else
  git --version
  exit 1
fi

if [ "$(version3 "$curl_version")" -gt "$(version3 "7.30.0")" ]; then
  echo "---curl---"
  echo "$curl_version is greater than 7.30.0!"
  echo " "
else
  curl --version
  exit 1
fi

if [ "$(version2 "$vim_tiny_version")" -gt "$(version2 "7.0")" ]; then
  echo "---vim.tiny---"
  echo "$vim_tiny_version is greater than 7.0!"
  echo " "
else
  vim.tiny --version
  exit 1
fi

if [ "$(version3 "$node_version")" -gt "$(version3 "6.9.0")" ]; then
  echo "---node---"
  echo "$node_version is greater than 6.9.0 !"
  echo " "
else
  node --version
  exit 1
fi

if [ "$(version3 "$npm_version")" -gt "$(version3 "3.10.9")" ]; then
  echo "---npm---"
  echo "$npm_version is greater than 3.10.9 !"
  echo " "
else
  npm --version
  exit 1
fi
