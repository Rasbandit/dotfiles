#!/bin/bash

# Check if vault name and item name are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <vault_name> <item_name>"
    exit 1
fi

vault_name=$1
item_name=$2

# Generate JSON using `op item get` command
input_json=$(op item get "$item_name" --vault "$vault_name" --format json)

# Define the secrets file path using the $HOME variable
secrets_file="$HOME/.bash_secrets"

# Function to add or update environment variables
add_or_update_env() {
    local object=$1
    local key=$(jq -r '.label' <<< "$object")
    local value=$(jq -r '.value' <<< "$object")

    # Check if the value is null or empty
    if [[ $value == "null" || -z $value ]]; then
        return
    fi

    # Create or update environment variable in the specific file
    echo "export $key=\"$value\"" >> "$HOME/.bash_secrets_$item_name"
}

# Parse JSON and loop over fields
fields=$(echo "$input_json" | jq -c '.fields[]')

# Create a new .bash_secrets file for the current item
echo "# Environment variables for $item_name" > "$HOME/.bash_secrets_$item_name"

# Iterate over fields
while IFS= read -r field; do
    add_or_update_env "$field"
done <<< "$fields"

# Define the sourcing line for the current item
sourcing_line="source \"\$HOME/.bash_secrets_$item_name\""

# Check if the sourcing line already exists in the .bash_secrets file
if ! grep -qF "$sourcing_line" "$secrets_file"; then
    # Append sourcing of the newly created .bash_secrets file to the main .bash_secrets file
    echo "$sourcing_line" >> "$secrets_file"
fi

source "$HOME/.bash_secrets"