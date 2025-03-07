# multiarch-gdbserver-static

I encountered various problems when cross-compiling the static multiarch-gdbserver-static, so I'm putting the compiled multiarch-gdbserver-static here.

Building 9.2 was quite easy. However, you will encounter issues like 
- `make: *** No rule to make target '../gnulib/import/libgnu.a', needed by 'gdbserver'.  Stop.`.

- `make: *** No rule to make target '../libiberty/libiberty.a', needed by 'gdbserver'.  Stop.`.
- ......

I first saw discussions about this problem in version 10.1, and it still exists in the latest versions to this day.
****

[riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain)
```sh
git clone https://github.com/riscv/riscv-gnu-toolchain

sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip python3-tomli libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev

./configure --prefix=/opt/riscv --enable-multilib --with-languages=c,c++

make && make install

```
