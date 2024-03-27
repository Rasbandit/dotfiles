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

# Function to add or update environment variables
add_or_update_env() {
    local object=$1
    local key=$(jq -r '.label' <<< "$object")
    local value=$(jq -r '.value' <<< "$object")

    # Check if the value is null or empty
    if [[ $value == "null" || -z $value ]]; then
        echo "Skipping $key because the value is empty"
        return
    fi

    # Check if the variable already exists
    if grep -q "^export $key=" "$HOME/.bash_secrets"; then
        # Update the existing variable
        sed -i "s|^export $key=.*|export $key=\"$value\"|g" "$HOME/.bash_secrets"
    else
        # Add a new variable
        echo -e "export $key=\"$value\"" >> "$HOME/.bash_secrets"
    fi
}

# Parse JSON and loop over fields
fields=$(echo "$input_json" | jq -c '.fields[]')

# Iterate over fields
while IFS= read -r field; do
    add_or_update_env "$field"
done <<< "$fields"

# Source the file to apply changes immediately
source "$HOME/.bash_secrets"
