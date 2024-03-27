#!/bin/bash

# Function to add or update environment variables
add_or_update_env() {
    local key=$1
    local value=$2

    # Check if the value is empty
    if [ -z "$value" ]; then
        echo "Skipping empty value for $key"
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
fields=$(echo "$input_json" | jq -r '.fields[]')
while IFS= read -r field; do
    label=$(echo "$field" | jq -r '.label')
    value=$(echo "$field" | jq -r '.value')
    add_or_update_env "$label" "$value"
done <<< "$fields"

# Source the file to apply changes immediately
source "$HOME/.bash_secrets"