#!/bin/bash

# Define the directory containing CSV files and the PostgreSQL database details
CSV_DIR="/mnt/c/Users/zaina/Documents/Core_Data_Engineering/Linux_Project/csv_files"
DB_NAME="posey"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"

# Iterate over each CSV file in the directory
for CSV_FILE in "$CSV_DIR"/*.csv; do
  if [[ -f "$CSV_FILE" ]]; then
    # Extract the base name of the CSV file (without directory and extension)
    TABLE_NAME=$(basename "$CSV_FILE" .csv)
    
    # Import CSV file into PostgreSQL database
    echo "Importing $CSV_FILE into PostgreSQL database $DB_NAME, table $TABLE_NAME..."

    psql -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -c "\COPY $TABLE_NAME FROM '$CSV_FILE' WITH (FORMAT csv, HEADER);"

    echo "Import completed for $CSV_FILE"
  else
    echo "No CSV files found in the directory $CSV_DIR"
  fi
done

