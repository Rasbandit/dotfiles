#!/bin/bash

sudo nala update && sudo nala upgrade -y

~/.setup-scripts/apt/lens.sh
~/.setup-scripts/apt/tailscale.sh

sudo nala install -y \
lens \
tailscale

~/.setup-scripts/apt/slack.sh
~/.setup-scripts/other-installs/kubectl.sh
~/.setup-scripts/other-installs/aws-cli.sh

~/.setup-scripts/mount-secret-envar.sh "Gala" "Gala Envars"

aws sso login

aws eks update-kubeconfig --name dev-chain-platform-eks
aws eks update-kubeconfig --name stage-chain-platform-eks
aws eks update-kubeconfig --name prod-chain-platform-eks
aws eks update-kubeconfig --name chain-plt-ue1-tnt
aws eks update-kubeconfig --name k8s-test-restoration-eks
