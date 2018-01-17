#!/bin/bash -ex

compile() {
    pushd $1
    makepkg --skippgpcheck
    yes | LANG=C sudo pacman -U *.pkg.tar.xz
    popd
}

main() {
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
    compile mingw-w64-pkg-config
    compile mingw-w64-configure
}

main
