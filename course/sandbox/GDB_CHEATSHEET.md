# GDB / Pwndbg cheatsheet for x86_64 ASM

This sandbox uses Pwndbg as a nicer GDB frontend.

## Start A Debug Session

Terminal 1, inside the container:

```sh
make debug-server
```

Terminal 2, from the `sandbox` directory on the host:

```sh
task gdb
```

If the program exits, restart QEMU in terminal 1:

```sh
make debug-server
```

Then reconnect in Pwndbg:

```gdb
target remote :1234
```

## Core Movement

```gdb
si
stepi
```

Step one assembly instruction, entering calls.

```gdb
ni
nexti
```

Step one assembly instruction, skipping over calls.

```gdb
continue
c
```

Continue until the next breakpoint or program exit.

```gdb
finish
```

Run until the current function returns.

```gdb
interrupt
```

Stop a running program and return to the debugger.

## Breakpoints

```gdb
break _start
b _start
```

Break on a symbol.

```gdb
break *0x401000
b *0x401000
```

Break on an exact address.

```gdb
info breakpoints
i b
```

List breakpoints.

```gdb
delete 1
d 1
```

Delete breakpoint number 1.

```gdb
disable 1
enable 1
```

Temporarily disable or re-enable a breakpoint.

```gdb
break *0x401019 if $rax == 1
```

Conditional breakpoint.

```gdb
commands 1
  info registers
  x/4i $rip
  continue
end
```

Run commands automatically when breakpoint 1 is hit.

## Registers

```gdb
info registers
i r
```

Show all general registers.

```gdb
info registers rax rdi rsi rdx rsp rip
```

Show selected registers.

```gdb
p/x $rax
p/d $rax
p/t $rax
```

Print a register in hex, decimal, or binary.

```gdb
set $rax = 60
set $rdi = 0
```

Modify registers.

```gdb
set $rip = 0x401000
```

Jump execution to an address by changing `rip`.

## Disassembly

```gdb
disassemble _start
disassemble /r _start
```

Disassemble a symbol. `/r` also shows raw instruction bytes.

```gdb
x/10i $rip
x/20i 0x401000
```

Examine instructions at the current `rip` or at an address.

```gdb
set disassembly-flavor intel
set disassembly-flavor att
```

Switch between Intel and AT&T syntax.

Pwndbg shortcuts:

```gdb
nearpc
nearpc 20
context
```

Show nearby instructions and the full Pwndbg context view.

## Memory

GDB's `x` command means examine memory:

```gdb
x/16xb $rsp
```

Show 16 bytes in hex.

```gdb
x/8gx $rsp
```

Show 8 giant words, meaning 8-byte values.

```gdb
x/16wx $rsp
```

Show 16 words, meaning 4-byte values.

```gdb
x/s 0x402000
x/s $rsi
```

Show a null-terminated string.

```gdb
x/13cb $rsi
```

Show 13 bytes as characters.

```gdb
x/13xb $rsi
```

Show 13 bytes as hex bytes.

Useful formats:

```text
x  hex
d  signed decimal
u  unsigned decimal
t  binary
i  instruction
s  string
c  character
b  byte
h  halfword, 2 bytes
w  word, 4 bytes
g  giant word, 8 bytes
```

## Stack

```gdb
x/16gx $rsp
```

Inspect the top of the stack.

```gdb
p/x $rsp
p/x $rsp + 8
```

Print stack addresses.

```gdb
set *(long*)$rsp = 0x401000
```

Write an 8-byte value to the top of the stack.

```gdb
telescope $rsp
telescope $rsp 20
```

Pwndbg stack pointer chain view.

## Syscalls

For Linux x86_64 syscalls:

```text
rax = syscall number
rdi = arg1
rsi = arg2
rdx = arg3
r10 = arg4
r8  = arg5
r9  = arg6
```

Example before `write(1, message, len)`:

```gdb
info registers rax rdi rsi rdx
x/s $rsi
```

After a syscall:

```gdb
p/d $rax
p/x $rax
```

`rax` contains the return value. Negative values usually mean an error.

## Watchpoints

```gdb
watch *(long*)$rsp
```

Stop when the value at `$rsp` changes.

```gdb
rwatch *(char*)0x402000
```

Stop when an address is read.

```gdb
awatch *(char*)0x402000
```

Stop when an address is read or written.

## Process And Mappings

```gdb
info files
```

Show loaded file sections and entry point.

```gdb
maintenance info sections
```

Show detailed section mapping.

Pwndbg:

```gdb
vmmap
```

Show memory mappings.

```gdb
elfheader
```

Show ELF header information.

```gdb
got
plt
```

Useful when debugging dynamically linked binaries.

## Search Memory

```gdb
search -t string "Hello"
```

Pwndbg search for a string.

```gdb
search -t qword 0x401000
```

Search for an 8-byte value.

Plain GDB:

```gdb
find 0x400000, 0x405000, "Hello"
```

Search an address range.

## Patching While Debugging

```gdb
set $rax = 1
set $rdi = 1
```

Patch register values.

```gdb
set {char}0x402000 = 'h'
```

Patch one byte in memory.

```gdb
set {long}($rsp) = 0x4141414141414141
```

Patch 8 bytes on the stack.

```gdb
jump *0x401000
```

Continue execution from a specific address.

## Reverse-Engineering Habits

Start with:

```gdb
info files
entry
break _start
context
```

Then inspect:

```gdb
nearpc
info registers
vmmap
x/16gx $rsp
```

Before every syscall:

```gdb
info registers rax rdi rsi rdx r10 r8 r9
x/s $rsi
```

After every suspicious pointer:

```gdb
x/16gx $rax
x/s $rax
telescope $rax
```

When lost:

```gdb
context
bt
info registers
x/10i $rip
```

## Common Pwndbg Commands

```gdb
context
nearpc
telescope
vmmap
search
hexdump
piebase
canary
checksec
cyclic 100
cyclic -l 0x6161616b
```

Some commands are more useful for C binaries, exploits, or dynamically linked
programs than for tiny syscall-only ASM programs.

## Exiting

```gdb
detach
quit
```

If QEMU is still waiting in terminal 1, `detach` lets it continue. `quit`
closes Pwndbg.
