#!/bin/sh


  cp master.rst index.rst
  tinker -b
  cd blog/html
  python -m SimpleHTTPServer
