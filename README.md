# Automated Transaction Monitoring Dashboard

## Project Overview
The goal of this project is to automate transaction activity monitoring, with emphasis on successful and unsuccessful transactions,to give clear insights into transaction counts and values, the dashboard does not include airtime or data transactions. Operational efficiency is increased and manual labor is decreased by this automation.

## Project Objectives
Monitor transaction activity: Track successful (status 0) and unsuccessful (status 2) transactions across different bank schemas.
Focus on core transactions: Since airtime and data transactions make up a minor portion of total transaction volume and may not offer meaningful insights into fundamental financial activity, we have excluded them from our analysis.This project focuses on transactions that have a more direct impact on financial performance and business operations.
Promote Well-Informed Decision-Making: Provide actionable insights into transaction trends and error rates to quickly address issues.

## Features
- **Automated Dashboard**: Daily updates at a predetermined time to ensure that the dashboard displays the most recent transaction data.
- **Email Notifications**: To facilitate communication and decision-making, pertinent stakeholders receive automated reports via email.
- **Transaction Monitoring**: To aid in well-informed decision-making and error correction, this feature tracks both successful and unsuccessful transactions—apart from airtime and data transactions.
- **Transaction Counts: Sums together the quantity of both successful and unsuccessful transactions.
- **Transaction Values: **Combines the total amount of all transactions while identifying successful and unsuccessful ones.
** Data Filtering: Removes all transactions pertaining to data and airtime.
- **Error Analysis: To aid in operational troubleshooting, errors are found and reported.

## Data Source
- **Database**: PostgreSQL
- **Tables**: Transactions from various schemas (e.g., Gold, Silver, Bronze, Diamond, Platinum, Iron)

## Tools and Technologies
- **Database**: PostgreSQL
- **Programming Languages**: SQL
- **Data Visualisation**: Apache Superset

## Queries
- **Successful Transactions**: Get total values and counts of transactions that are successful, excluding data and airtime transactions.
- **unsuccessful Transactions**: Get total values and counts of errors excluding airtime and data transactions, this query retrieves the total counts and values of unsuccessful transactions.

# Getting Started
- **Setup**: Ensure PostgreSQL is installed and setup.
- **Open PostgreSQL Database**: Confirm that you are able to access the database where the transaction records are stored
- **Connect to PostgreSQL Database**: Verify that you have access to the PostgreSQL database.
- **Run SQL Queries**:  Use Apache Superset to run the SQL queries directly from the {/SQL/} directory.
- **Generate Charts**:Utilising the information from the SQL queries, create charts in Apache Superset.
- **Create Dashboard**: Utilise Apache Superset to include the produced charts into a unified dashboard.
- **Automation**: Program a scheduler or cron job to reload the dashboard every day at a predetermined time

## Project Files
- **`Superset/`**: Contains the dashboard image.
- **`SQL/`**: Consists of SQL queries that are used to retrieve transaction data.
- **`data/`**: Contains the datasets used for the project
- **`CONFIG/**: Contains the email configuration details
- **`README.md`**:This folder contains project documentation.

## Email Service Integration
To automate report delivery, the report is connected with an email service. This repository contains email service configuration data.

## Notes
- The goal of this project is to automate the reporting process in order to save time and manual effort

## Contact
For any questions or feedback, please contact: ebytt2017@gmail.com