#!/bin/bash

git clone https://github.com/eza-community/eza.git
cd eza
cargo install --path .

cd ..
rm -rf eza