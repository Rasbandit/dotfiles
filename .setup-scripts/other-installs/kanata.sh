#!/bin/bash

git clone git@github.com:jtroo/kanata.git /tmp/kanata

cargo install kanata --path /tmp/kanata
systemctl --user enable kanata.service