#!/bin/bash

SRC_DIR="/home/rasbandit/ES-DE/"
DST_DIR="/mnt/es-de-nas/"
rsync -av --delete --no-perms --no-owner --no-group --omit-dir-times --exclude 'roms/' "$SRC_DIR" "$DST_DIR"