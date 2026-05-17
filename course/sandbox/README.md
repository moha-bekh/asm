# ASM debug sandbox

Self-contained x86_64 assembly sandbox for Mac M1/M2/M3 using:

- native ARM64 Debian container
- `nasm`
- `x86_64-linux-gnu-ld`
- `qemu-x86_64`
- `pwndbg`

Build the Docker image:

```sh
task -t sandbox/Taskfile.yaml build
```

Open the sandbox container:

```sh
task -t sandbox/Taskfile.yaml up
```

Inside the container, build and run:

```sh
make
make RUNNER=qemu-x86_64
```

The default linker is `x86_64-linux-gnu-ld`. Override it with `LINKER=...`
only if you need a different linker.

To debug, terminal 1:

```sh
make debug-server
```

Terminal 2:

```sh
task -t sandbox/Taskfile.yaml gdb
```

Useful GDB commands:

```gdb
continue
si
info registers
x/16gx $rsp
disassemble /r _start
context
vmmap
nearpc
quit
```

## Valgrind

Valgrind runs in a separate AMD64 container because the binaries in this
sandbox are x86_64 Linux binaries.

```sh
task -t sandbox/Taskfile.yaml build-valgrind
task -t sandbox/Taskfile.yaml valgrind
```

Or, from inside the `sandbox` directory:

```sh
task build-valgrind
task valgrind
```
