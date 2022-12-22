#!/bin/bash -eu

repo=https://github.com/wfeldt/libx86emu.git
version=$1
tmp=$(mktemp -d)

(
    cd $tmp
    git clone ${repo} libx86emu
    cd libx86emu
    git reset --hard ${version}
    # the build system needs this
    make changelog # this creates VERSION as well
)

cp -f ${tmp}/libx86emu/changelog debian/CHANGELOG
rm -rf ${tmp}
git add debian/CHANGELOG
git commit -a -m "Updated upstream changelog"
