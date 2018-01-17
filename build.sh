#!/bin/bash -ex

function compile {
    pushd $1
    makepkg --skippgpcheck
    yes | LANG=C pacman -U *.pkg.tar.xz
    popd
}

#pacman -S ppl zlib libmpc gmp --noconfirm

compile mingw-w64-binutils
compile mingw-w64-headers
compile mingw-w64-headers-bootstrap
compile isl
compile osl
compile cloog
compile mingw-w64-gcc-base
compile mingw-w64-crt
compile mingw-w64-winpthreads
compile mingw-w64-gcc
