#!/bin/sh
set -e -x

rm -rf site-lisp
cp -R vendor site-lisp

cd site-lisp
/usr/local/bin/emacs -batch -f batch-byte-compile *.el || :
