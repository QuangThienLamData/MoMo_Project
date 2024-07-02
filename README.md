# Overview
This project aims to analyze the performance of MoMo's top-up service.

The data includes:

- Historical daily transactions from Jan-Dec 2020 (table 'Transactions')
- Users' demographic information (table 'User_info')
- Commission percentages paid by Telco merchants to MoMo (table 'Commission')
MoMo's top-up service allows users to recharge prepaid phone accounts via e-Wallet apps, Internet, SMS, or bank accounts. It functions like an online money transfer using phone numbers. Supported network operators include Mobifone, Viettel, VinaPhone, Vietnamobile, and Wintel.

The analysis consists of five steps:

- Use python to process raw data and convert data into a consistent format (Momo_project_datacleaning).
- Import cleaned data into MSSQL SERVER for data modeling (data_modeling).
- Conduct an in-depth analysis of MoMo's top-up business (Momo_project_DA).
- Conduct user segmentation based on RFM method with k-means clustering algorithm.
- Import data from MSSQL SERVER to PowerBI to create perfromance-tracking dashboard.
# Data cleaning
- Users table
  - Remove duplicated user_id in users table
  - Correct the data integrity, consitence of column `location` and `gender` in user table
  - Checking the logic of `first_tran_date` column and correct it
  - Change data type of `first_tran_date` column
- Transactions table
  - Correct the data integrity, consitence of column `purchase_status`
  - Remove the commas in data of `amount` column
  - Change data type of `Date` and `amount` column.
Finally, Importing those tables from python into MSSQL SERVER for data modeling.
# The analysis
- Descriptive Analysis
  - More than half of MoMo's top-up service users base comes from locations outside of Ho Chi Minh City and Hanoi.
  - The proportion of male and female users is 6/4.
  - The main user's age bracket is from 23 to 32 which is accounted for approximately 50%.
  - Half of the users who recharge their phone accounts using MoMo use Viettel SIM cards.
  - Recharging for user's own phone account is the dominant method.
- Detailed Analysis

| min_amount |	second_quartile |	median |	mean_amount |	third_quartile |	max_amount |	standard_deviation |
|------------|------------------|--------|--------------|----------------|-------------|---------------------|
| 10000	     | 20000	          | 30000	 | 51471	      | 50000	         | 2500000	   | 73315.346766        |

![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/6b1d3c7f-94a5-42ad-b99b-0b56a2f030e0)

