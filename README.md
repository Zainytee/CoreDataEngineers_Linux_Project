# CoreDataEngineers Linux Project

## Overview

Welcome to the CoreDataEngineers Linux Project repository! This project involves a series of tasks related to data engineering, including the development of ETL processes, database interactions, and documentation. The aim is to enhance our data processing capabilities and facilitate better data analysis.

## Project Structure

- **`Scripts/`**: Contains all the scripts used in the project.
  - **`Bash/`**: Bash scripts for ETL processing.
  - **`SQL/`**: SQL scripts for database queries.
- **`Data Pipeline Architecture.png`**: Architectural diagram of the ETL pipeline.
- **`ETL_log.txt`**: Log file tracking ETL job execution.

## Tasks Completed

### 1. **ETL Pipeline Development**

- **ETL Bash Script**: Developed a Bash script (`ETL_Process.sh`) to handle data extraction, transformation, and loading (ETL) from CSV files.
- **Cron Job Scheduling**: Configured a cron job to run the ETL script daily at midnight.
- **Logging**: Implemented logging to track ETL job execution.

### 2. **SQL Queries**

- **Query Scripts**: Created SQL scripts (`Queries.sql`) for various database queries, including:
  - List of order IDs where either `gloss_qty` or `poster_qty` exceeds 4000.
  - Orders with `standard_qty` zero and either `gloss_qty` or `poster_qty` over 1000.
  - Company names starting with 'C' or 'W' and primary contact containing 'ana' or 'Ana' but not 'eana'.
  - Region for each sales rep along with their associated accounts.

### 3. **Documentation**

- **Architectural Diagram**: Designed an ETL pipeline architecture diagram (`Data Pipeline Architecture.png`) to visualize the data processing workflow.
- **README File**: Compiled a comprehensive README file to summarize project tasks and provide guidelines.


