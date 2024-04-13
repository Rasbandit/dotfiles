#!/bin/bash

sudo apt update

sudo snap install slack

~/.setup-scripts/apt/lens.sh
~/.setup-scripts/apt/tailscale.sh
~/.setup-scripts/other-installs/kubectl.sh
~/.setup-scripts/other-installs/aws-cli.sh

~/.setup-scripts/mount-secret-envar.sh "Gala" "Gala Envars"

aws configure set aws_access_key_id "$(op item get "Gala AWS New" --fields label=access_key_id)" --profile chain
aws configure set aws_secret_access_key "$(op item get "Gala AWS New" --fields label=secret_access_key)" --profile chain
aws configure set region us-east-1 --profile chain
aws configure set output json --profile chain

aws configure set aws_access_key_id "$(op item get "Gala AWS" --fields label=access_key_id)"
aws configure set aws_secret_access_key "$(op item get "Gala AWS" --fields label=secret_access_key)"
aws configure set region us-east-1
aws configure set output json

aws eks update-kubeconfig --name dev-chain-platform-eks --profile chain
aws eks update-kubeconfig --name stage-chain-platform-eks --profile chain
aws eks update-kubeconfig --name prod-chain-platform-eks --profile chain

aws eks update-kubeconfig --name dev-galachain
aws eks update-kubeconfig --name stage-galachain
aws eks update-kubeconfig --name prod-galachain
