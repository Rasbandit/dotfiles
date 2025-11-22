#!/bin/bash

# Script to retrieve a note from 1Password and save it to a file
# Assumes 1Password CLI (op) is installed and signed in

# Configuration
NOTE_ITEM_NAME="your-note-item-name"  # Replace with the actual item name in 1Password
OUTPUT_FILE="/path/to/secure/directory/note.txt"  # Replace with desired output path, ensure directory has restricted permissions

# Ensure the directory exists (optional, remove if not needed)
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Retrieve the note and save to file
op item get "$NOTE_ITEM_NAME" --fields notesPlain > "$OUTPUT_FILE"

# Optional: Set restrictive permissions on the file
chmod 600 "$OUTPUT_FILE"

echo "Note updated at $(date)"