# multiarch-gdbserver-static

I encountered various problems when cross-compiling the static multiarch-gdbserver-static, so I'm putting the compiled multiarch-gdbserver-static here.

Building 9.2 was quite easy. However, you will encounter issues like 
- `make: *** No rule to make target '../gnulib/import/libgnu.a', needed by 'gdbserver'.  Stop.`.

- `make: *** No rule to make target '../libiberty/libiberty.a', needed by 'gdbserver'.  Stop.`.
- ......

I first saw discussions about this problem in version 10.1, and it still exists in the latest versions to this day.
# multiarch-toolchain
**For ubuntu:**

[riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain)
```sh
git clone https://github.com/riscv/riscv-gnu-toolchain

sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip python3-tomli libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev

./configure --prefix=/opt/riscv --enable-multilib

make && make install

```
Other-toolchain
```sh
sudo apt install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi -y
sudo apt install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf -y
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu -y

sudo apt install gcc-mipsel-linux-gnu g++-mipsel-linux-gnu -y
sudo apt install gcc-mips64el-linux-gnuabi64 g++-mips64el-linux-gnuabi64 -y

sudo apt install gcc-mips-linux-gnu g++-mips-linux-gnu -y
sudo apt install gcc-mips64-linux-gnuabi64 g++-mips64-linux-gnuabi64 -y

sudo apt install gcc-powerpc-linux-gnu g++-powerpc-linux-gnu -y
sudo apt install gcc-powerpc64-linux-gnu g++-powerpc64-linux-gnu -y

sudo apt install gcc-riscv64-linux-gnu g++-riscv64-linux-gnu -y

sudo apt install gcc-alpha-linux-gnu g++-alpha-linux-gnu -y
sudo apt install gcc-s390x-linux-gnu g++-s390x-linux-gnu -y
sudo apt install gcc-sparc64-linux-gnu g++-sparc64-linux-gnu -y
```

[musl-toolschain](https://musl.cc/)

