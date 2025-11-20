#!/bin/bash

sudo dnf install @development-tools gcc-c++ wl-clipboard libxkbcommon-devel dbus-devel wxGTK-devel.x86_64 -y
cargo install --force cargo-make --version 0.34.0


# Clone the Espanso repository
git clone https://github.com/espanso/espanso

cd espanso

# Compile espanso in release mode
# NOTE: this will take a while (~5/15 minutes)
cargo make --profile release --env NO_X11=true build-binary 

sudo mv target/release/espanso /usr/local/bin/espanso

sudo setcap "cap_dac_override+p" $(which espanso)

# Register espanso as a systemd service (required only once)
espanso service register

# Start espanso
espanso start

cd ..
rm -rf espanso
