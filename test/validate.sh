#!/bin/bash

YAML_FILES=$(find . -name '*.yaml')

if [ -z "$YAML_FILES" ]; then
  echo "No YAML files found."
  exit 1
fi

for file in $YAML_FILES; do
  kubeval "$file"
  if [ $? -ne 0 ]; then
    echo "Validation failed for $file"
    exit 1
  fi
done

echo "All YAML files validated successfully."