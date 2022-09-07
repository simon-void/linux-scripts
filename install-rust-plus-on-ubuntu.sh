#!/bin/sh

# install openssl support for rust, needed by sccache and when working with openssl in rust projects
# openssl-dev is the name of the package ssl requires on Ubuntu, but it's different on Fedora (openssl-devel)
su apt install openssl-dev
su apt install pgk-config

# let's make sure curl is installed
su apt install curl

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# a better test-runner
cargo install cargo-nextest --locked

# linter
rustup component add clippy

# sccache caches compiled libs to speedup compilation
cargo install sscache
printf '[build]\nrustc-wrapper = ".cargo/bin/sccache"\n' > ~/.cargo/config.toml
