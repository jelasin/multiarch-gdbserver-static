# multiarch-gdbserver-static

I encountered various problems when cross-compiling the static multiarch-gdbserver-static, so I'm putting the compiled multiarch-gdbserver-static here.

Building 9.2 was quite easy. However, you will encounter issues like `'../gnulib/import/libgnu.a', needed by 'gdbserver'`. I first saw discussions about this problem in version 10.1, and it still exists in the latest versions to this day.

You know the module separation of the gdb project is poorly done. I can't just compile gdbserver, it's funny.
