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
  - More than half of MoMo's top-up service users base came from locations outside of Ho Chi Minh City and Hanoi.
  - The proportion of male and female users was 6/4.
  - The main user's age bracket was from 23 to 32 which is accounted for approximately 50%.
  - Half of the users who recharge their phone accounts using MoMo used Viettel SIM cards.
  - Recharging for user's own phone account was the dominant method.
- Detailed Analysis

| min_amount |	second_quartile |	median |	mean_amount |	third_quartile |	max_amount |	standard_deviation |
|------------|------------------|--------|--------------|----------------|-------------|---------------------|
| 10000	     | 20000	          | 30000	 | 51471	      | 50000	         | 2500000	   | 73315.346766        |

![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/cef65f36-c6d6-4850-a119-3a1f95bb1c3d)

The majority of transactions (75%) were below 50,000 dong, and most of them involve low transaction values. I recommend that MoMo offer additional discounts or cashback deals for account recharges exceeding 50,000 dong to enhance the transactions value of users.
![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/62612d48-9eeb-4152-ac32-8ee33d626c49)
During the last two quarters of the year, phone account recharging experienced high demand. In the first two quarters, MoMo should introduce more attractive offers and promotional programs to encourage users to utilize top-up services during this period.
![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/4611d566-f695-4950-84ba-06c918f6106e)
![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/1cb87cc2-d72a-4222-867a-00dc6dd1bd99)
MoMo’s highest average profit comes from users on the Vinaphone mobile network. To capitalize on this, MoMo should focus on attracting more Vinaphone users and offering targeted deals for them.
![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/531544aa-f605-4c0e-a6c9-022778350adb)
![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/0dfd621e-e9e0-404e-aaa1-f66e526a612f)
The number of new users has gradually decreased over time, while the rate of repeat transactions from existing users remains low. To address this, MoMo should implement a targeted promotion and marketing campaign for top-up services, along with robust after-service policies to retain existing users.
![image](https://github.com/QuangThienLamData/MoMo_Project/assets/138430723/6b1d3c7f-94a5-42ad-b99b-0b56a2f030e0)

