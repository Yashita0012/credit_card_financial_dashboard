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
``` Age Grouping (New Column)
AgeGroup = SWITCH(
    TRUE(),
    'public cust_detail'[customer_age] < 30, "20-30",
    'public cust_detail'[customer_age] >= 30 && 'public cust_detail'[customer_age] < 40, "30-40",
    'public cust_detail'[customer_age] >= 40 && 'public cust_detail'[customer_age] < 50, "40-50",
    'public cust_detail'[customer_age] >= 50 && 'public cust_detail'[customer_age] < 60, "50-60",
    'public cust_detail'[customer_age] >= 60, "60+",
    "unknown"
)
```
```Income Grouping (New Column)
IncomeGroup = SWITCH(
    TRUE(),
    'public cust_detail'[income] < 35000, "Low",
    'public cust_detail'[income] >= 35000 && 'public cust_detail'[income] < 70000, "Med",
    'public cust_detail'[income] >= 70000, "High",
    "unknown"
)
```
```Week Number (New Column)
week_num2 = WEEKNUM('public cc_detail'[week_start_date])
Revenue Calculation (New Column)
Revenue = 'public cc_detail'[annual_fees] + 
          'public cc_detail'[total_trans_amt] + 
          'public cc_detail'[interest_earned]
```
```Revenue Calculation (New Column)
Revenue = 'public cc_detail'[annual_fees] + 
          'public cc_detail'[total_trans_amt] + 
          'public cc_detail'[interest_earned]
```
```Current Week Revenue (New Measure)
Current_week_Reveneue = CALCULATE(
    SUM('public cc_detail'[Revenue]),
    FILTER(
        ALL('public cc_detail'),
        'public cc_detail'[week_num2] = MAX('public cc_detail'[week_num2])
    )
)
```
```Previous Week Revenue (New Measure)
Previous_week_Reveneue = CALCULATE(
    SUM('public cc_detail'[Revenue]),
    FILTER(
        ALL('public cc_detail'),
        'public cc_detail'[week_num2] = MAX('public cc_detail'[week_num2]) - 1
    )
)
```
```Week-over-Week Revenue Change (New Measure)
WOW_REVENUE = DIVIDE(
    ('public cc_detail'[Current_week_Reveneue] - 'public cc_detail'[Previous_week_Reveneue]),
    'public cc_detail'[Previous_week_Reveneue]
)
```



## Step 4: Dashboard Design & Visualization in Power BI
#####  Dashboard Title:

Credit Card Transaction Report

##### Charts:
**Chart 1**Stacked Line Chart.
X-Axis: Quarter
Y-Axis: Revenue


**Chart 2** Stacked Bar Chart
X-Axis: Expenditure Type
Y-Axis: Revenue


**Chart 3** Stacked Bar Chart
X-Axis: Education Level
Y-Axis: Revenue

**Chart 4** Stacked Bar Chart
X-Axis: Job Type
Y-Axis: Revenue

**Chart 5**: Stacked Bar Chart
X-Axis: Card Chip
Y-Axis: Revenue

**Chart 6**: Table
Columns:
Card Category
Sum of Revenue
Total Transaction Amount
Interest Earned

**KPI Cards:**
Card 1: Revenue (Title: Revenue)
Card 2: Total Interest Earned (Title: Total Interest)
Card 3: Total Transaction Amount (Title: Transaction Amount)

**Slicer:**
Based on Week Start Date.

**Tree Map Charts**:
Tree Map 1: Quarter vs Client Number.
Tree Map 2: Gender Category (Average of Client Number).
Tree Map 3: Card Category (Average of Client Number).
