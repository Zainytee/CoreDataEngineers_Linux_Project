#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="/mnt/c/Users/zaina/Documents/Core_Data_Engineering/Linux_Project/SOURCE"
DEST_DIR="/mnt/c/Users/zaina/Documents/Core_Data_Engineering/Linux_Project/json_and_CSV"

# Create the destination directory if it does not exist
mkdir -p "$DEST_DIR"

# Move all CSV and JSON files from the source directory to the destination directory
find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.csv" -o -name "*.json" \) -exec mv {} "$DEST_DIR" \;

# Notify the user
echo "All CSV and JSON files have been moved from $SOURCE_DIR to $DEST_DIR."

