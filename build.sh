#!/bin/bash -ex

compile() {
    pushd pkgs/$1
    MAKEFLAGS="-j2" makepkg --skippgpcheck >/dev/null
    yes | LANG=C sudo pacman -U *.pkg.tar.xz
    popd
}

main() {
    compile mingw-w64-binutils
    compile mingw-w64-headers
    compile mingw-w64-headers-bootstrap
    compile mingw-w64-gcc-base
    compile mingw-w64-crt
    compile mingw-w64-winpthreads
    sudo pacman -Sy gcc-ada --noconfirm
    compile mingw-w64-gcc
    compile mingw-w64-pkg-config
    compile mingw-w64-environment
    compile mingw-w64-configure

    ls -lha
}

main
