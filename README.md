# multiarch-gdbserver-static

I encountered various problems when cross-compiling the static multiarch-gdbserver-static, so I'm putting the compiled multiarch-gdbserver-static here.

Building 9.2 was quite easy. However, you will encounter issues like 
- `make: *** No rule to make target '../gnulib/import/libgnu.a', needed by 'gdbserver'.  Stop.`.

- `make: *** No rule to make target '../libiberty/libiberty.a', needed by 'gdbserver'.  Stop.`.
- ...

I first saw discussions about this problem in version 10.1, and it still exists in the latest versions to this day.

****

If you encounter the following error during compilation, please use [musl-gcc](https://musl.cc/).
```text
/usr/lib/gcc-cross/riscv64-linux-gnu/11/../../../../riscv64-linux-gnu/bin/ld: gdbreplay.o: in function `.L14':
gdbreplay.cc:(.text+0x272): warning: Using 'getaddrinfo' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
  CXXLD  gdbserver
/usr/lib/gcc-cross/riscv64-linux-gnu/11/../../../../riscv64-linux-gnu/bin/ld: thread-db.o: in function `.L139':
thread-db.cc:(.text+0x1226): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/usr/lib/gcc-cross/riscv64-linux-gnu/11/../../../../riscv64-linux-gnu/bin/ld: nat/linux-osdata.o: in function `.L0 ':
linux-osdata.c:(.text+0x2636): warning: Using 'getgrgid' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/usr/lib/gcc-cross/riscv64-linux-gnu/11/../../../../riscv64-linux-gnu/bin/ld: ../gnulib/import/libgnu.a(libgnu_a-glob.o): in function `.L122':
glob.c:(.text+0xd44): warning: Using 'getpwnam_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/usr/lib/gcc-cross/riscv64-linux-gnu/11/../../../../riscv64-linux-gnu/bin/ld: nat/linux-osdata.o: in function `.L0 ':
linux-osdata.c:(.text+0x73c): warning: Using 'getpwuid_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/usr/lib/gcc-cross/riscv64-linux-gnu/11/../../../../riscv64-linux-gnu/bin/ld: remote-utils.o: in function `.LEHB7':
remote-utils.cc:(.text+0x54c): warning: Using 'getaddrinfo' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
```
