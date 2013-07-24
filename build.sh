#!/bin/sh
set -e -x

rm -rf site-lisp
cp -R vendor site-lisp

cd site-lisp
/usr/local/bin/emacs -batch -f batch-byte-compile *.el || :

mkdir _src
mv auctex _src
cd _src/auctex
./configure --prefix=`pwd` \
    --with-texmf-dir=$HOME/Library/texmf \
    --with-lispdir=$HOME/.emacs.d/site-lisp
make
make install

cd ../../gnuplot-mode
./configure
make

cd ../org-mode
make autoloads
