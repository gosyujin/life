#!/bin/sh

cp master.rst index.rst
tinker -b

if [ $1 = "build" ]; then
  :
elif [ $1 = "serve" ]; then
  cd blog/html
  python -m SimpleHTTPServer 4000
elif [ $1 = "deploy" ]; then
  cd blog/html
  cp -r blog/html/* _site/

  DATE=`date +"%Y/%m/%d %T"`

  git add -A
  git comm "Deploy at ${DATE}"
  git push -f origin gh-pages:gh-pages
  cd ../../
fi
