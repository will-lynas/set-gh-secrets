#!/usr/bin/env bash

SECRETS_DIR=$1

if [ -z "$SECRETS_DIR" ]; then
    echo "Error: Please provide the secrets directory as an argument."
    exit 1
fi

for file in "$SECRETS_DIR"/*; do
    if [[ -f $file ]]; then
        secret_name=$(basename "$file")
        secret_value=$(cat "$file")
        gh secret set "$secret_name" --body "$secret_value"
    fi
done
