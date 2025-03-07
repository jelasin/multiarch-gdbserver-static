# 9.2 not support riscv

curl https://ftp.gnu.org/gnu/gdb/gdb-9.2.tar.gz --output gdb-9.2.tar.gz
tar -zxvf ./gdb-9.2.tar.gz
cd gdb-9.2

# arm-32-little gdbserver
mkdir build_arm_static && cd build_arm_static
CC="arm-linux-gnueabi-gcc" CXX="arm-linux-gnueabi-g++" ../gdb/gdbserver/configure --target=arm-linux-gnueabi --host="arm-linux-gnueabi"
make LDFLAGS=-static -j $(nproc) && cd ..

# mips-32-little gdbserver
mkdir build_mipsel_static && cd build_mipsel_static
CC="mipsel-linux-gnu-gcc" CXX="mipsel-linux-gnu-g++" ../gdb/gdbserver/configure --target=mipsel-linux-gnu --host="mipsel-linux-gnu"
make LDFLAGS=-static -j $(nproc) && cd ..

# mips-32-big gdbserver
mkdir build_mips_static && cd build_mips_static
CC="mips-linux-gnu-gcc" CXX="mips-linux-gnu-g++" ../gdb/gdbserver/configure --target=mips-linux-gnu --host="mips-linux-gnu"
make LDFLAGS=-static -j $(nproc) && cd ..

# mips64-64-little gdbserver
mkdir build_mips64el_static && cd build_mips64el_static
CC="mips64el-linux-gnuabi64-gcc" CXX="mips64el-linux-gnuabi64-g++" ../gdb/gdbserver/configure --target=mips64el-linux-gnuabi64 --host="mips64el-linux-gnuabi64"
make LDFLAGS=-static -j $(nproc) && cd ..

# mips64-64-big gdbserver
mkdir build_mips64_static && cd build_mips64_static
CC="mips64-linux-gnuabi64-gcc" CXX="mips64-linux-gnuabi64-g++" ../gdb/gdbserver/configure --target=mips64-linux-gnuabi64 --host="mips64-linux-gnuabi64"
make LDFLAGS=-static -j $(nproc) && cd ..

# powerpc-32-big gdbserver
mkdir build_ppc_static && cd build_ppc_static
CC="powerpc-linux-gnu-gcc" CXX="powerpc-linux-gnu-g++" ../gdb/gdbserver/configure --target=powerpc-linux-gnu --host="powerpc-linux-gnu"
make LDFLAGS=-static -j $(nproc) && cd ..

# aarch64-64-little gdbserver
mkdir build_aarch64_static && cd build_aarch64_static
CC="aarch64-linux-gnu-gcc" CXX="aarch64-linux-gnu-g++" ../gdb/gdbserver/configure --target=aarch64-linux-gnu --host="aarch64-linux-gnu"
make LDFLAGS=-static -j $(nproc) && cd ..
