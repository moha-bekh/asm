FROM debian:bookworm-slim

ARG PKGS="ca-certificates curl xz-utils file procps less ncurses-term nasm make qemu-user binutils-x86-64-linux-gnu"

RUN apt-get update \
  && apt-get install -y --no-install-recommends $PKGS \
  && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -LsSf 'https://install.pwndbg.re' \
  | sh -s -- -t pwndbg-gdb

WORKDIR /sandbox
