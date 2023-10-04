#!/bin/bash

# List all conda environments except 'base'
environments=$(conda info --envs | awk '{print $1}' | grep -v "^base$")

for env in $environments; do
    # Check to avoid accidentally deleting 'base'
    if [ "$env" != "base" ]; then
        echo "Removing environment: $env"
        conda env remove --name "$env"
    fi
done
