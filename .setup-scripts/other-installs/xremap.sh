#!/bin/bash

# Install xremap with GNOME/Wayland support

# Clone and build from source
git clone https://github.com/xremap/xremap.git ~/Downloads/xremap
cargo install xremap --features gnome --path ~/Downloads/xremap
rm -rf ~/Downloads/xremap

# Add user to input group (requires logout/login to take effect)
sudo usermod -aG input "$USER"

# Create systemd service
mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/xremap.service << EOF
[Unit]
Description=Start xremap with custom configuration
Documentation=https://github.com/xremap/xremap

[Service]
Type=simple
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:$HOME/.cargo/bin
Environment=DISPLAY=:0
Environment=HOME=$HOME
ExecStart=$HOME/.cargo/bin/xremap $HOME/.config/xremap/config.yml
Restart=always

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable xremap.service

echo ""
echo "xremap installed. Log out and back in, then run:"
echo "  systemctl --user start xremap"