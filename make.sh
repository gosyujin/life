#!/bin/sh

make html
cd build/html

if [ $1 = "post" ]; then
  :
elif [ $1 = "serve" ]; then
  python -m SimpleHTTPServer
elif [ $1 = "deploy" ]; then
  DATE=`date +"%Y/%m/%d %T"`

  git add -A
  git comm "Deploy at ${DATE}"
  git push -f origin gh-pages:gh-pages
  cd ../../
fi
