#!/bin/sh
set -e -x

rm -rf site-lisp
cp -R vendor site-lisp
rm -rf site-lisp/auctex site-lisp/pretty-symbols

cd site-lisp
/usr/local/bin/emacs -batch -f batch-byte-compile *.el || :

# mkdir _src
# mv auctex _src
# cd _src/auctex
# ./configure --prefix=`pwd` \
#     --with-texmf-dir=$HOME/Library/texmf \
#     --with-lispdir=$HOME/.emacs.d/site-lisp
# make
# make install
# cd ../../

cd gnuplot-mode
./configure
gmake

cd ../org-mode
gmake autoloads

cd ../cedet
find . -name Makefile | xargs touch
gmake
