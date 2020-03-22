#!/bin/bash -ex

download() {
    pushd pkgs
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/${1}.tar.gz
    tar -xvzf ${1}.tar.gz
    popd
}

main() {
    rm -R pkgs
    mkdir -p pkgs

    download mingw-w64-binutils
    download mingw-w64-headers
    download mingw-w64-headers-bootstrap
    download mingw-w64-gcc-base
    download mingw-w64-crt
    download mingw-w64-winpthreads
    download mingw-w64-gcc
    download mingw-w64-pkg-config
    download mingw-w64-environment
    download mingw-w64-configure

    rm pkgs/*.tar.gz
}

main
