#!/bin/bash

# stop on error
set -e

# let's make sure curl is installed
sudo apt install curl

# install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Rust needs a linker
# install mold, since it's the fastest linker, see https://github.com/rui314/mold
# mold requires clang which provides "a language front-end and tooling infrastructure for languages in the C language family"
sudo apt install mold clang

# install openssl support for rust, needed by sccache and when working with openssl in rust projects
# libssl-dev is the name of the package ssl requires on Ubuntu, but it's different on Fedora (openssl-devel)
sudo apt install libssl-dev pkg-config

# reload .profile so that cargo is available
source ~/.profile

# sccache caches compiled libs to speedup compilation
cargo install sccache

# configure global cargo options to always use sccache and mold
echo '
[build]
rustc-wrapper = ".cargo/bin/sccache"

[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=mold"]
' > ~/.cargo/config.toml

## install optional Rust addons
# a better (nicer UI and often faster) test-runner (instead of `cargo test` use `cargo nextest run` to execute your tests)
cargo install cargo-nextest --locked
# run cargo commands in the background to reduce perceived compilation time
# e.g. `cargo watch` only triggers `cargo check` which is the default
# e.g. `cargo watch -x check -x test` triggers first `cargo check` followed by `cargo test`
# e.g. `cargo watch -x check -s 'cargo nextest run'` triggers first `cargo check` followed by `cargo nextest run`
cargo install cargo-watch
# wasm-pack compiles Rust to WASM to interop with js (more on how to use it here: https://rustwasm.github.io/docs/wasm-pack/quickstart.html)
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh