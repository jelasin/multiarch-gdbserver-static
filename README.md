# multiarch-gdbserver-static

I encountered various problems when cross-compiling the static multiarch-gdbserver-static, so I'm putting the compiled multiarch-gdbserver-static here.

Building 9.2 was quite easy. However, you will encounter issues like 
- `make: *** No rule to make target '../gnulib/import/libgnu.a', needed by 'gdbserver'.  Stop.`.

- `make: *** No rule to make target '../libiberty/libiberty.a', needed by 'gdbserver'.  Stop.`.
- ......

I first saw discussions about this problem in version 10.1, and it still exists in the latest versions to this day.

****

If you encounter the following error during compilation, please use [musl-gcc](https://musl.cc/).

This situation usually occurs in higher version compilations.

Error 1.
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
Error 2.
```text
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: ../gnulib/import/libgnu.a(strerror_r.o): Relocations in generic ELF (EM: 243)
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: ../gnulib/import/libgnu.a: error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
make: *** [Makefile:362: gdbreplay] Error 1
make: *** Waiting for unfinished jobs....
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: unknown architecture of input file `../libiberty/libiberty.a(safe-ctype.o)' is incompatible with aarch64 output
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: /usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/lib/../lib/libc.a(libc-start.o): in function `call_fini':
(.text+0x4): undefined reference to `__fini_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x8): undefined reference to `__fini_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x14): undefined reference to `__fini_array_end'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x18): undefined reference to `__fini_array_end'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x28): undefined reference to `__fini_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x2c): undefined reference to `__fini_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: /usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/lib/../lib/libc.a(libc-start.o): in function `__libc_start_main_impl':
(.text+0x378): undefined reference to `__preinit_array_end'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x37c): undefined reference to `__preinit_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x380): undefined reference to `__preinit_array_end'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x384): undefined reference to `__preinit_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x3c0): undefined reference to `__init_array_end'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x3c4): undefined reference to `__init_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x3c8): undefined reference to `__init_array_end'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: (.text+0x3cc): undefined reference to `__init_array_start'
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: libinproctrace.so: hidden symbol `__init_array_end' isn't defined
/usr/lib/gcc-cross/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
make: *** [Makefile:389: libinproctrace.so] Error 1
```
Error 3.
......
