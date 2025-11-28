#!/bin/bash

sudo dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
sudo dnf install tailscale

sudo systemctl enable --now tailscaled
#!/bin/bash
