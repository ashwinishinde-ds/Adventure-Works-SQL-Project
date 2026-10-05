# 🚴 Adventure Works – SQL Data Analysis Project

## 📌 Project Overview

This project is a practical **SQL Data Analysis project** based on the Adventure Works dataset.

The objective of this project is to combine sales data, enrich the sales table using customer and product information, create analytical fields, calculate business metrics, and perform sales analysis using MySQL.

The project focuses on transforming raw sales data into meaningful business information that can be used for reporting, analysis, and dashboard development.

---

## 🏢 About Adventure Works

Adventure Works Cycles is a multinational manufacturing company that manufactures and sells metal and composite bicycles across North American, European, and Asian markets.

The company aims to:

- Expand its market share
- Target its best customers
- Increase product availability through its website
- Reduce the cost of sales through lower production costs

---

## 🎯 Project Objectives

The major objectives of this project are:

- Combine multiple sales datasets
- Enrich sales data using lookup operations
- Create date-related analytical fields
- Calculate Sales Amount
- Calculate Production Cost
- Calculate Profit
- Perform monthly, yearly, and quarterly sales analysis
- Analyze business performance by products, customers, and regions
- Prepare data for visualization and dashboard reporting

---

## 🗂️ Dataset

The project uses the following Adventure Works datasets:

### Dimension Tables

- `DimCustomer`
- `DimDate`
- `DimProduct`
- `DimProductCategory`
- `DimProductSubCategory`
- `DimSalesTerritory`

### Fact Tables

- `FactInternetSales`
- `Fact_Internet_Sales_New`

The two fact tables are combined to create the consolidated `Sales` table.

---

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
