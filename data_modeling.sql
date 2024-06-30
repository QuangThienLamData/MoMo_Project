-- Changing the data type and column name
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'users';
go
alter table users 
alter column User_id int not null;
go
EXEC sp_rename 'users.User_id', 'user_id', 'COLUMN';
EXEC sp_rename 'users.First_tran_date', 'first_tran_date', 'COLUMN';
EXEC sp_rename 'users.Location', 'location', 'COLUMN';
EXEC sp_rename 'users.Age', 'age', 'COLUMN';
EXEC sp_rename 'users.Gender', 'gender', 'COLUMN';
go
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'transactions';
go
alter table transactions
alter column order_id bigint not null;
alter table transactions
alter column user_id int;
alter table transactions
alter column Amount int;
alter table transactions
alter column Merchant_id smallint;
go
EXEC sp_rename 'transactions.Amount', 'amount', 'COLUMN';
EXEC sp_rename 'transactions.Merchant_id', 'merchant_id', 'COLUMN';
EXEC sp_rename 'transactions.Purchase_status', 'purchase_status', 'COLUMN';
go
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'commission';
go
alter table commission
alter column Merchant_id smallint not null;
alter table commission
alter column Rate_pct smallint;
EXEC sp_rename 'commission.Merchant_name', 'merchant_name', 'COLUMN';
EXEC sp_rename 'commission.Merchant_id', 'merchant_id', 'COLUMN';
EXEC sp_rename 'commission.Rate_pct', 'rate_pct', 'COLUMN';
-- Bulding data model
ALTER TABLE users
ADD CONSTRAINT PK_users PRIMARY KEY (user_id);
ALTER TABLE users
ADD CONSTRAINT C_users_gender CHECK (gender IN ('Male', 'Female'));
ALTER TABLE users
ADD CONSTRAINT C_users_location CHECK (location IN ('HCMC', 'HN', 'Other'));
go
ALTER TABLE transactions
ADD CONSTRAINT PK_transactions PRIMARY KEY (order_id);
ALTER TABLE transactions
ADD CONSTRAINT FK_transactions_users FOREIGN KEY (user_id)
references users;
ALTER TABLE transactions
add constraint C_transactions_status check (purchase_status in ('truc tiep','mua ho'));
go
ALTER TABLE commission
ADD CONSTRAINT PK_commission PRIMARY KEY (merchant_id);
ALTER TABLE transactions
ADD CONSTRAINT FK_transactions_commission FOREIGN KEY (merchant_id)
references commission;
go
-- Stored Procedure to calculate the number of new customer
create procedure usp_new_cus @month int, @year int 
as 
begin 
    select 
        format(datetrunc(month, first_tran_date), 'yyyy-MM') as month_year, 
        count(*) as new_cus 
    from users 
    where 
        month(first_tran_date) = @month and 
        year(first_tran_date) = @year 
    group by format(datetrunc(month, first_tran_date), 'yyyy-MM') 
end;
--Import RFM result from k-means clustering in python into MSSQL SERVER
BULK INSERT dbo.rfm
FROM 'C:\Users\LENOVO\PycharmProjects\rfm.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO
--Create cluster_name column
alter table users
add cluster_name nvarchar(50);
go
--Update the cluster_name column
UPDATE users
SET cluster_name = rfm.cluster_name
FROM rfm
WHERE users.user_id = rfm.user_id;
select * from users