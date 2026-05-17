set architecture i386:x86-64
set disassembly-flavor intel
set pagination off
target remote :1234
break _start
