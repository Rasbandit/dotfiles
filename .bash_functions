#!/bin/bash

decompress_all() {
    DIRECTORY=${1:-'.'}

    for file in "$DIRECTORY"/*; do
        case "$file" in
            *.zip)
                echo "Decompressing $file..."
                unzip -o "$file" -d "${file%.*}"
                ;;
            *.7z)
                echo "Decompressing $file..."
                7z x "$file" -o"${file%.*}"
                ;;
            *.tar)
                echo "Decompressing $file..."
                mkdir -p "${file%.*}" && tar -xf "$file" -C "${file%.*}"
                ;;
            *.tar.gz | *.tgz)
                echo "Decompressing $file..."
                mkdir -p "${file%.*}" && tar -xzf "$file" -C "${file%.*}"
                ;;
            *.tar.bz2 | *.tbz2)
                echo "Decompressing $file..."
                mkdir -p "${file%.*}" && tar -xjf "$file" -C "${file%.*}"
                ;;
            *.rar)
                echo "Decompressing $file..."
                mkdir -p "${file%.*}" && unrar x "$file" "${file%.*}/"
                ;;
            *)
                echo "Skipping $file: unsupported file type."
                ;;
        esac
    done
}