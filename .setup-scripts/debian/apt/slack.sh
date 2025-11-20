#!/bin/bash

wget -O slack.deb https://downloads.slack-edge.com/desktop-releases/linux/x64/4.37.101/slack-desktop-4.37.101-amd64.deb

sudo nala install ./slack.deb -y
rm slack.deb