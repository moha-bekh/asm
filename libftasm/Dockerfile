FROM debian:bookworm-slim

ARG PKGS="nasm gcc gdb make"

RUN apt-get update \
  && apt-get install -y $PKGS \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /shared
