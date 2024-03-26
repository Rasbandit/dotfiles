#!/bin/bash

# VScode
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt update && sudo apt install code -y

curl -L -o ~/Downloads/vs-code-dracula-theme.zip "https://drive.google.com/uc?export=download&id=1i8XaplBkeLiEUVYUYiH1MlAOCQf5Ohfm"
unzip ~/Downloads/vs-code-dracula-theme.zip -d ~/Downloads

code --install-extension ~/Downloads/visual-studio-code/dracula-pro.vsix

rm ~/Downloads/vs-code-dracula-theme.zip
rm -r ~/Downloads/visual-studio-code