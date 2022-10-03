#!/bin/sh

# let's make sure curl is installed
sudo apt install curl

# install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Rust needs a linker
# install mold, since it's the fastest linker, see https://github.com/rui314/mold which requires clang
sudo apt install mold clang

# install openssl support for rust, needed by sccache and when working with openssl in rust projects
# libssl-dev is the name of the package ssl requires on Ubuntu, but it's different on Fedora (openssl-devel)
sudo apt install libssl-dev pkg-config

# sccache caches compiled libs to speedup compilation
cargo install sccache

# configure global cargo options to always use sccche and mold
printf '
[build]
rustc-wrapper = ".cargo/bin/sccache"

[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=mold"]
' > ~/.cargo/config.toml

## install useful Rust components
# a better test-runner
cargo install cargo-nextest --locked