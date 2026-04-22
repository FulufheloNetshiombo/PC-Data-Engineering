# Data Engineering ETL Project – SQL Server Star Schema

## 📌 Project Overview

This project demonstrates a Data Engineering ETL pipeline built using Microsoft SQL Server Management Studio (SSMS). The goal is to transform raw transactional data into a structured Star Schema consisting of dimension tables and a central fact table.

The project simulates a real world data warehouse design process, including:

* Data extraction from a raw CSV dataset
* Data transformation and cleaning using SQL
* Loading data into dimension and fact tables (ETL process)
* Implementation of stored procedures to automate data processing

---

## 🏗️ Architecture

The data model was designed using draw.io:

<img width="974" height="948" alt="PCData Model drawio" src="https://github.com/user-attachments/assets/83925152-eeba-48dc-bac3-ef66a27d63af" />

---

## ⭐ Star Schema Design

The project follows a Star Schema structure with multiple dimension tables connected to a central fact table.

### 🔹 Dimension Tables

* **dim_customer** – Customer details
* **dim_location** – Geographical data (continent, country/state, city/province)
* **dim_date** – Purchase and shipping dates
* **dim_pc_spec** – Product specifications
* **dim_salesperson** – Salesperson details
* **dim_payment** – Payment method used
* **dim_channel** – Sales channel (online or physical store)
* **dim_priority** – Priority level for PC repairs
* **dim_shops** – Store information

---

### 🔹 Fact Table

* **fact_pc_sales** – Central transactional table that stores sales data

  * Contains measurable metrics such as sales amount, cost, and finance details
  * Includes foreign keys linking to all dimension tables
  * Serves as the core table for reporting and analytics

---

## 🔄 ETL Process

### 1. Extract

Raw data was sourced from:

* **mainpc_data** table (original dataset imported from CSV)

---

### 2. Transform

Data was cleaned and prepared using SQL:

* Handled NULL values using `COALESCE`
* Converted string-based dates using `TRY_CONVERT`
* Standardized and validated data for consistency

---

### 3. Load

Data was loaded into structured tables:

* Dimension tables
* Fact table (`fact_pc_sales`)

---

## ⚙️ Stored Procedures

Stored procedures were created to automate and standardize the ETL process:

* Store data transformation logic in one place
* Make the code easy to reuse and maintain
* Allow data to be loaded into dimension and fact tables repeatedly
* Support a data pipeline that can handle more data as the system grows

---

## 🚀 Key Outcomes

* Designed and implemented a Star Schema data model
* Built a complete ETL pipeline using SQL Server
* Created a centralized fact table for analytics
* Automated data processes using stored procedures
* Improved data quality through transformation and validation

---

## 📂 Project Structure

```
## 📂 Project Structure

```text
PC_DATA_ETL_PROJECT
│
├── 📁 data
│   └── raw_data.csv
│
├── 📁 data_model
│   └── data_model.png
│
├── 📁 scripts
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_staging_load.sql
│   ├── 04_transformations.sql
│   ├── 05_load_dimensions.sql
│   ├── 06_load_fact_table.sql
│   ├── 07_stored_procedures.sql
│
├── 📁 tests
│   └── validation_queries.sql
│
├── README.md
└── .gitignore
```

```

---

## 💡 Tools & Technologies

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* Draw.io (for data modeling)
* GitHub (version control)

---

## 📈 Use Case

This project demonstrates how raw transactional data can be transformed into a structured data warehouse model for:

* Reporting
* Business intelligence
* Data analysis

---

## 📬 Author

Fulufhelo Netshiombo




