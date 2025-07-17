# Zepto-Inventory-SQL-data-analysis-project
This is a comprehensive, real-world data analyst portfolio project built around an e-commerce inventory dataset scraped from Zepto — one of India’s fastest-growing quick-commerce startups. It replicates the end-to-end workflow of a data analyst, from initial data exploration to delivering business-driven insights.


# 📁 Dataset Overview
The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. 
Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.
🧾 Columns:
name: Product name as it appears on the app

category: Product category like Fruits, Snacks, Beverages, etc.

mrp: Maximum Retail Price (originally in paise, converted to ₹)

discountPercent: Discount applied on MRP

discountedSellingPrice: Final price after discount (also converted to ₹)

availableQuantity: Units available in inventory

weightInGms: Product weight in grams

outOfStock: Boolean flag indicating stock availability

quantity: Number of units per package (mixed with grams for loose produce)

# 🔧 Project Workflow
1. Data Import
Loaded CSV using MySQl import feature.

2.  Data Exploration
:- Counted the total number of records in the dataset

:- Viewed a sample of the dataset to understand structure and content

:- Checked for null values across all columns

:- Identified distinct product categories available in the dataset

:- Compared in-stock vs out-of-stock product counts

3. Data Cleaning
:- Identified and removed rows where MRP or discounted selling price was zero

:- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability

4. Business Insights

:- Found top 10 best-value products based on discount percentage

:- Products that are being sold at a discount of more than 25% and are still in stock

:-Identified high-MRP products that are currently out of stock

:- Estimated potential revenue for each product category

:- Filtered expensive products (MRP > ₹500) with minimal discount

:- Ranked top 5 categories offering highest average discounts

:- Calculated price per gram to identify value-for-money products

:- Grouped products based on weight into Low, Medium, and Bulk categories

:- Measured total inventory weight per product category

:- Total Inventory Value Per Category



