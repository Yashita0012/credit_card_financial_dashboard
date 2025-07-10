# :octocat: Credit Card Weekly Dashboard Project

## Project Objective

The objective of this project is to **develop a comprehensive Credit Card Weekly Dashboard** that delivers **real-time insights** into key performance metrics and trends. This dashboard enables stakeholders to effectively **monitor, analyze, and make data-driven decisions** regarding credit card operations.

---

## Project Steps (Complete Workflow)

### Step 1: Import Data into SQL Database
1. Prepare two CSV files:
   - `credit_card_details.csv`
   - `credit_card_customer_details.csv`
2. Create a new PostgreSQL database:
```sql
CREATE DATABASE credit_Card_Db;
```
### Step 2: Connect PostgreSQL Database to Power BI
1. Open **Power BI Desktop**.
2.Click Get Data → Choose **PostgreSQL or MySQL**.
3.Provide required database connection details:
  **Server: localhost**
  Database: credit_Card_Db
3.Enter your PostgreSQL username and password.
4.Load the imported data into Power BI.
### Step 3: Data Processing in Power BI
Dashboard 1 Name: **cc_transaction_report**
**Data Transformation:**
1. Open **Transform Data** to clean and shape the dataset.
2.Create new columns using DAX formulas under **Table Tools**.
##### DAX Queries: 
// Age Grouping (New Column)
AgeGroup = SWITCH(
    TRUE(),
    'public cust_detail'[customer_age] < 30, "20-30",
    'public cust_detail'[customer_age] >= 30 && 'public cust_detail'[customer_age] < 40, "30-40",
    'public cust_detail'[customer_age] >= 40 && 'public cust_detail'[customer_age] < 50, "40-50",
    'public cust_detail'[customer_age] >= 50 && 'public cust_detail'[customer_age] < 60, "50-60",
    'public cust_detail'[customer_age] >= 60, "60+",
    "unknown"
)
//

