#!/bin/sh

cp master.rst index.rst
tinker -b

if [ $1 = "build" ]; then
  :
elif [ $1 = "serve" ]; then
  cd blog/html
  python -m SimpleHTTPServer 4000
elif [ $1 = "deploy" ]; then
  rm -rf _site/*
  cp -r blog/html/* _site/
  cd _site

  DATE=`date +"%Y/%m/%d %T"`

  git add -A
  git com "Deploy at ${DATE}"
  git push -f origin gh-pages:gh-pages
  cd ../../
  rm -rf blog/html
fi
