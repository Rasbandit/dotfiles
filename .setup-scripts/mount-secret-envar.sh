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
    local key=$1
    local value=$2

    # Check if the value is empty
    if [[ -z $value ]]; then
        echo "Skipping $key because the value is empty"
        return
    fi

    # Check if the variable already exists
    if grep -q "^export $key=" "$HOME/.bash_secrets"; then
        # Update the existing variable
        sed -i "s|^export $key=.*|export $key=\"$value\"|g" "$HOME/.bash_secrets"
    else
        # Add a new variable
        echo "export $key=\"$value\"" >> "$HOME/.bash_secrets"
    fi
}

# Parse JSON and loop over fields
labels=$(echo "$input_json" | jq -r '.fields[].label')
values=$(echo "$input_json" | jq -r '.fields[].value')

# Iterate over the arrays in parallel
while IFS= read -r label && IFS= read -r value; do
    add_or_update_env "$label" "$value"
done <<< "$(paste <(echo "$labels") <(echo "$values"))"

# Source the file to apply changes immediately
source "$HOME/.bash_secrets"