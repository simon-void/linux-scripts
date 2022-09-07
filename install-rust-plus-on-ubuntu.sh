#!/bin/sh

# let's make sure curl is installed
sudo apt install curl
# Rust needs a linker
sudo apt install build-essential

# install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# a better test-runner
cargo install cargo-nextest --locked

# install openssl support for rust, needed by sccache and when working with openssl in rust projects
# openssl-dev is the name of the package ssl requires on Ubuntu, but it's different on Fedora (openssl-devel)
sudo apt install libssl-dev
sudo apt install pkg-config

# sccache caches compiled libs to speedup compilation
cargo install sccache
printf '[build]\nrustc-wrapper = ".cargo/bin/sccache"\n' > ~/.cargo/config.toml
