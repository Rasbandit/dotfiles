#!/bin/bash

curl -L -o ~/Downloads/vs-code-dracula-theme.zip "https://drive.google.com/uc?export=download&id=1i8XaplBkeLiEUVYUYiH1MlAOCQf5Ohfm"
unzip ~/Downloads/vs-code-dracula-theme.zip -d ~/Downloads

code --install-extension ~/Downloads/visual-studio-code/dracula-pro.vsix

rm ~/Downloads/vs-code-dracula-theme.zip
rm -r ~/Downloads/visual-studio-code