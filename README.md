# 🚴 Adventure Works SQL Data Analysis Project

## 📌 Project Overview

This project is a practical **SQL Data Analysis project based on the Adventure Works dataset**.

The project demonstrates how raw Excel datasets can be loaded into MySQL using Python and then analyzed using SQL.

The complete workflow is:

**Excel Dataset → Python/Pandas → MySQL Database → SQL Transformation → Data Analysis**

The project includes multiple dimension and fact tables related to customers, products, dates, sales territories, and internet sales.

---

## 🏢 About Adventure Works

Adventure Works Cycles is a multinational manufacturing company that manufactures and sells metal and composite bicycles across North American, European, and Asian markets.

The company focuses on:

- Expanding market share
- Targeting its best customers
- Increasing product availability through its website
- Reducing cost of sales through lower production costs

---

# 🎯 Project Objectives

The main objectives of this project are:

- Load Excel datasets into MySQL
- Create an Adventure Works database
- Combine sales data from multiple fact tables
- Merge product-related information
- Perform customer and product lookups
- Create date-related analytical fields
- Calculate Sales Amount
- Calculate Production Cost
- Calculate Profit
- Perform monthly sales analysis
- Perform yearly sales analysis
- Perform quarterly sales analysis
- Compare Sales Amount and Production Cost
- Prepare data for reporting and visualization

---

# 🛠️ Tools & Technologies

### Database
- MySQL

### Programming
- Python

### Python Libraries
- Pandas
- OpenPyXL
- MySQL Connector

### Data Sources
- Microsoft Excel (`.xlsx`)

### Analysis
- SQL
- Data Transformation
- Data Cleaning
- Aggregation
- Business Analysis

---

# 🔄 Project Workflow

```text
                Excel Dataset
                      │
                      ▼
              Python + Pandas
                      │
                      ▼
              MySQL Connector
                      │
                      ▼
             MySQL Database
             adventure_works
                      │
                      ▼
             SQL Transformation
                      │
                      ▼
               Sales Analysis
                      │
                      ▼
              Business Insights

## 🏗️ Data Model

The project follows a dimensional data-model structure where the Sales table acts as the central fact table.

```text
                    DimCustomer
                         |
                         |
DimDate ----------- Sales ----------- DimProduct
                         |
                         |
                  DimSalesTerritory
