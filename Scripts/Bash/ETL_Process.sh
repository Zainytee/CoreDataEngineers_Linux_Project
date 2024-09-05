#!/bin/bash

echo "Starting the ETL process at $(date)" >> /mnt/c/Users/zaina/Documents/Core_Data_Engineering/Linux_Project/ETL_log.txt

# Define directories
RAW_DIR="raw"
TRANSFORMED_DIR="Transformed"
GOLD_DIR="Gold"

# Create directories if they don't exist
mkdir -p "$RAW_DIR" "$TRANSFORMED_DIR" "$GOLD_DIR"

# Check if CSV_URL environment variable is set
if [ -z "$CSV_URL" ]; then
    echo "Error: CSV_URL environment variable is not set."
    exit 1
fi

# Define file paths
RAW_FILE="$RAW_DIR/raw_data.csv"
TRANSFORMED_FILE="$TRANSFORMED_DIR/2023_year_finance.csv"

# Download the CSV file using the environment variable
curl -o "$RAW_FILE" "$CSV_URL"

# Confirm the file has been successfully saved into the raw folder
if [[ -f "$RAW_FILE" ]]; then
    echo "File has been downloaded successfully and saved in the raw folder."
else
    echo "Failed to download the file"
    exit 1
fi

# Transformation: Renaming columns and selecting specific columns
awk -F, 'NR==1 { 
        for (i=1; i<=NF; i++) {
            if ($i == "Variable_code") $i = "variable_code"; 
            header[i] = $i 
        } 
    }
    NR > 1 {print $header[1], $header[2], $header[3], $header[4] }' OFS=, "$RAW_FILE" > "$TRANSFORMED_FILE"

# Confirming the file has been saved into the Transformed folder
if [[ -f "$TRANSFORMED_FILE" ]]; then
    echo "Transformation has been completed successfully."
else
    echo "Failed to transform the file"
    exit 1
fi

# Loading: Moving the transformed data into the Gold directory
mv "$TRANSFORMED_FILE" "$GOLD_DIR/"

# Confirming the file has been loaded into the Gold folder
if [[ -f "$GOLD_DIR/$(basename "$TRANSFORMED_FILE")" ]]; then
    echo "File has been loaded successfully."
else
    echo "Failed to load the file into the Gold folder"
    exit 1
fi




