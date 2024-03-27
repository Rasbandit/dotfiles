#!/bin/bash

sudo apt update

sudo snap install slack

~/.setup-scripts/apt/lens.sh
~/.setup-scripts/apt/tailscale.sh
~/.setup-scripts/other-installs/aws-cli.sh
~/.setup-scripts/other-installs/kubectl.sh
