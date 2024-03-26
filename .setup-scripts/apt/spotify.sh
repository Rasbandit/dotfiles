#!/bin/bash


curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client

# spotify_username=$(op item get Spotify --fields label=username)
# spotify_password=$(op item get Spotify --fields label=password)

# spotify --username=${spotify_username} --password=${spotify_password} --minimized