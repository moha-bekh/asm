# QEMU + Pwndbg debug setup

This setup avoids `gdb run` inside an emulated `linux/amd64` Docker container.
Instead, it runs a native ARM64 Debian container, executes the x86_64 binary
with `qemu-x86_64`, and lets Pwndbg connect to QEMU's gdbstub.

From the project root:

```sh
task -t debug/Taskfile.yaml build
task -t debug/Taskfile.yaml up
```

Inside the container shell:

```sh
make FILE=stack LD=x86_64-linux-gnu-ld
qemu-x86_64 -g 1234 ./stack
```

Then open a second terminal on the host and run:

```sh
task -t debug/Taskfile.yaml gdb FILE=stack
```

Useful Pwndbg/GDB commands:

```gdb
continue
si
ni
info registers
x/16gx $rsp
disassemble /r _start
context
vmmap
nearpc
quit
```

You can also use the helper tasks from the host:

```sh
task -t debug/Taskfile.yaml asm FILE=stack
task -t debug/Taskfile.yaml run FILE=stack
task -t debug/Taskfile.yaml server FILE=stack
task -t debug/Taskfile.yaml gdb FILE=stack
```
