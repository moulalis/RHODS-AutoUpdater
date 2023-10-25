#!/bin/bash

# Define the next version
next_version="rhods-2.5"

# Check if the file exists
if [ -f "upstream_sources.yml" ]; then
  # Read the contents of the YAML file into a variable
  yaml_data=$(cat upstream_sources.yml)

  # Replace 'branch: rhods-2.4' with 'branch: rhods-2.5'
  new_yaml_data="${yaml_data//branch: rhods-2.4/branch: $next_version}"

  # Overwrite the original file with the updated data
  echo "$new_yaml_data" > upstream_sources.yml

  echo "Updated 'branch' field to '$next_version' in upstream_sources.yml"
else
  echo "File 'upstream_sources.yml' not found."
fi
