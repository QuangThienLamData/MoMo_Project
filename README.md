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
- Conduct user segmentation based on RFM method with k-means clustering algorithm (Momo_RFM). 
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

| min_amount |	second_quartile |	median |	mean_amount |	`third_quartile` |	max_amount |	standard_deviation |
|------------|------------------|--------|--------------|------------------|-------------|---------------------|
| 10000	     | 20000	          | 30000	 | 51471	      | `50000`	         | 2500000	   | 73315.346766        |

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
# RFM Segmentation
The RFM model is based on three quantitative factors:
- Recency: How recently a customer has made a purchase.
- Frequency: How often a customer makes a purchase.
- Monetary value: How much money a customer spends on purchases.
After calculating the Recency-Frequency-Monetary (R-F-M) metrics, I applied the k-means clustering algorithm to segment MoMo’s user base into six distinct clusters. The result of k-means mainly based on monetary value.
- Cluster 0: 'Low-moderate spending users' had monetary value ranging from 80.000d to 150.000d and mean monetary is 100.000d.
- Cluster 1: 'Lowest spending users' had monetary value ranging from 10.000d to 30.000d and mean monetary is 16.750d.
- Cluster 2: 'Moderate spending users' had monetary ranging from 200.000d to 360.000d and mean monetary is 220.400d.
- Cluster 3: 'Top spending users' had monetary value above 2.000.000d.
- Cluster 4: 'High spending users' had monetary value ranging from 400.000d to 1.000.000d and mean monetary is 527.000d.
- Cluster 5: 'Low speding users' had monetary value ranging from 40.000d to 70.000d and mean monetary is 50.000d.
![image](https://github.com/user-attachments/assets/9c1649bf-ffde-4efb-a472-f78d7d32b3a3)
![image](https://github.com/user-attachments/assets/a185ec89-d04e-42a2-9b56-958f9ade0439)
- Users tended to use the top-up service of MoMo in the weekend anhd on Monday. To encourage users to conduct transactions on weekends and Mondays, MoMo could collaborate with mobile network providers to propose recharging discounts to users through SMS who top up their phone accounts on the MoMo platform during those days.
- Among the 6 user segments, three low-spending clusters contribute significantly to MoMo’s revenue, accounting for 72% of the total. Surprisingly, the most profitable cluster consists of low-moderate spenders, representing just over 15% of users but contributing 30% of total revenue. Meanwhile, although the ‘lowest spending users’ and ‘low spending users’ clusters comprised 80% of users, generate only 40% of revenue. Additionally, the remaining three clusters, representing just 5% of users, show untapped profit potential by contributing 30% of total revenue.
# Strategies for enhancing the experience of each cluster of users
- **Enhance Retention of low-moderate spending users**
  - Personalized offers and loyalty programs: Exclusive benefits to maintain satisfaction and spending.
  - Exceptional customer service: Top-notch support for this cluster of users to potentially convert moderate and high spending users.
  - Targeted marketing: Highlight additional services and benefits to boost loyalty.
  - Implement a Customer Loyalty Program: Loyalty programs can include discounts, rewards, or exclusive offers.
  
- **Engage more users to become a part of clusters above morderate spending**
  - Exceptional priviledge: High rate of cashback for transactions with high value.
  - Provide Excellent Customer Service: Address inquiries promptly and resolve issues effectively.
  - Invite to become a exclusive membership: Exceptional support service, offering tremendous incentives for repeating purchases, exclusive gift: free cellphone plan 4G data, MoMo point, vouchers of others services, etc

- **Educate and Convert Low Engagement Users**
  - Educational campaigns: Teach the benefits of using MoMo Top Up for regular payments.
  - Introductory promotions: Attractive offers to encourage frequent use.
  - Simplify user experience: Remove barriers for easier access and use.

# Limitations of the Analysis
- Temporal Scope: The dataset exclusively covers transactional data from the year 2020. Expanding the temporal scope could enhance our understanding of user behavior over time.
- Algorithmic Exploration: We focused on k-means clustering, but other algorithms (e.g., hierarchical clustering, DBSCAN) remain unexplored. Evaluating various clustering and classification methods would yield a more robust segmentation.
- Segment Characterization: Although we identified user segments, we haven’t delved deeply into their unique characteristics. Further analysis is necessary to understand their preferences, needs, and behaviors.
# Future Directions
- Customer Lifetime Value (CLV): Calculate CLV for all users and within each segment. This metric informs personalized marketing efforts and retention strategies.
- Algorithm Selection: Experiment with different clustering and classification algorithms. Rigorous evaluation will help identify the most suitable approach for our specific dataset.
- Segment Profiling: Conduct in-depth profiling of each user segment. Explore demographics, purchase patterns, and engagement levels to tailor marketing campaigns effectively.

THE END!!!
