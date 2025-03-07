#!/bin/bash

export CC="riscv64-linux-gnu-gcc"
export CXX="riscv64-linux-gnu-g++"

MY_HOST="riscv64-linux-gnu"
MY_TARGET="riscv64-linux-gnu"

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
            CFLAGS="-static" CXXFLAGS="-static" LDFLAGS="-static -s -ldl -lpthread"
make -j$(nproc)

cd $gdbsupport_dir
./configure --host=$MY_HOST --target=$TARGET_CROSS \
            CFLAGS="-static" CXXFLAGS="-static" LDFLAGS="-static -s -ldl -lpthread"
make -j$(nproc)

cd $libiberty_dir
./configure --host=$MY_HOST --target=$TARGET_CROSS \
            CFLAGS="-static" CXXFLAGS="-static" LDFLAGS="-static -s -ldl -lpthread"
make -j$(nproc)

cd $build_dir

$gdbserver_dir/configure --host=$MY_HOST --target=$TARGET_CROSS \
            CFLAGS="-static" CXXFLAGS="-static" \
            LDFLAGS="-static -s -L$gnulib_dir -L$gdbsupport_dir -L$libiberty_dir -ldl -lpthread"

make -j$(nproc)

echo "Compilation finished!"

