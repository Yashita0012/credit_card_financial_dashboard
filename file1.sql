/*create a table about the credit card details in the db*/
CREATE TABLE credit_card_detail(
         Client_Num INT,
		 Card_Category VARCHAR(20),
		 Annual_Fees INT,
		 Activation_30_Days INT , 
		 Customer_Acq_Cost INT , 
		 Week_Start_Date DATE ,
		 Week_Num VARCHAR(20),
		 Qtr VARCHAR(20),
		 current_year INT,
		 Credit_Limit Decimal(10,2),
		 Total_Revolving_Bal INT,
		 Total_Trans_Amt INT ,
		 Total_Trans_Vol INT ,
		 Avg_Utilization_Ratio DECIMAL(10,3),
		 Use_Chip VARCHAR(10),
		 Exp_Type VARCHAR(50),
		 Interest_Earned DECIMAL(10,3),
		 Delinquent_Acc VARCHAR(5)
);
CREATE TABLE  customer_detail (
           Client_Num INT,
		   Customer_Age INT,
		   Gender VARCHAR(5),
		   Dependent_Count INT,
		   Education_Level VARCHAR(50),
		   Marital_Status VARCHAR(20),
		   state_cd VARCHAR(50),
		   Zipcode VARCHAR(20),
		   Car_Owner VARCHAR(5),
		   House_Owner VARCHAR(5),
		   Personal_loan VARCHAR(5),
		   contact VARCHAR(50),
		   Customer_Job VARCHAR(50),
		   Income INT,
		   Cust_Satisfaction_Score INT
);

ALTER TABLE credit_card_detail 
Rename column week_start_date To Week_Start_Date;

select * from credit_card_detail;
select * from customer_detail;
