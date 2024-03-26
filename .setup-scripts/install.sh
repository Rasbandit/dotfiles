#!/bin/bash

# Check if the distribution is Ubuntu
if [ "$(lsb_release -si)" = "Ubuntu" ]; then
    ~/.setup-scripts/operating-systems/ubuntu-setup.sh
fi