#!/bin/bash

export PATH="/home/pwn/aarch/aarch64/aarch64-linux-musl-cross/bin:$PATH"
export CC="aarch64-linux-musl-gcc"
export CXX="aarch64-linux-musl-g++"

MY_HOST="aarch64-linux-musl"
MY_TARGET="aarch64-linux-musl"

build_dir=$(pwd)
gnulib_dir=$build_dir/../gnulib
gdbsupport_dir=$build_dir/../gdbsupport
libiberty_dir=$build_dir/../libiberty
gdbserver_dir=$build_dir/../gdbserver

if [ ! -d "$gnulib_dir" ] || [ ! -d "$gdbsupport_dir" ] || [ ! -d "$libiberty_dir" ] || [ ! -d "$gdbserver_dir" ]; then
    echo "One or more required directories do not exist."
    exit 1
fi

cd $gnulib_dir
./configure --host=$MY_HOST --target=$TARGET_CROSS \
            CFLAGS="-static" CXXFLAGS="-static" LDFLAGS="-static"
make -j$(nproc)

cd $gdbsupport_dir
./configure --host=$MY_HOST --target=$TARGET_CROSS \
            CFLAGS="-static" CXXFLAGS="-static" LDFLAGS="-static"
make -j$(nproc)

cd $libiberty_dir
./configure --host=$MY_HOST --target=$TARGET_CROSS \
            CFLAGS="-static" CXXFLAGS="-static" LDFLAGS="-static"
make -j$(nproc)

cd $build_dir

$gdbserver_dir/configure --host=$MY_HOST --target=$TARGET_CROSS \
            CFLAGS="-static" CXXFLAGS="-static" \
            LDFLAGS="-static -L$library_path -L$gnulib_dir -L$gdbsupport_dir"

make -j$(nproc)

echo "Compilation finished!"

