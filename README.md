# Data Engineering ETL Project – SQL Server Star Schema
🧾 **📌 Project Overview**

This project demonstrates a basic Data Engineering ETL pipeline using SQL Server Management Studio (SSMS). The goal was to transform raw transactional data into a structured Star Schema consisting of dimension tables and a fact table.

**The project simulates a real-world data warehouse design process, including:**

Data extraction from a raw csv table
Data transformation and cleaning using SQL
Loading data into dimension and fact tables (ETL process)

Architecture created using draw.io

**The project follows a Star Schema design:**

🔹 Dimension Tables

. dim_customer – customer details

. dim_location – geographical data (continent, country/state, city/province)

. dim_date – purchase and shipping dates

. dim_pc_spec - product details

. dim_salesperson - sales person details

. dim_payment - method of payment used 

. dim_channel - Describes whether the payment was done online or at the physical store

. dim_priority - described priority of fixing the pc

. dim_shops - store information

🔹 Fact Table

. Fact_pc_sales – transactional sales data with foreign keys linking to all dimensions

🔄 **ETL Process**

1. Extract

Raw data was sourced from:

. mainpc_data table (original dataset)

2. Transform

Data was cleaned using SQL:

. Handled NULL values using COALESCE

. Converted string dates using TRY_CONVERT

3. Load

. Data was loaded into structured tables: dimension tables and fact table


