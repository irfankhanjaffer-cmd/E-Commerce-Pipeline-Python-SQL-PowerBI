# Amazon Product Engagement Analysis

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-13%2B-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Desktop-F2C811?logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Completed-success)

## 📖 Overview
This project presents an **end-to-end e-commerce product engagement analysis** using Amazon product listing data.  
The objective is to transform raw, unstructured data into **actionable business insights** by applying data cleaning, feature engineering, database analytics, and interactive visualization techniques.

The workflow integrates **Python** for preprocessing, **PostgreSQL** for analytical querying, and **Power BI** for dashboard-driven storytelling.

---

## 🎯 Business Questions
- Which product categories generate the highest customer engagement?
- Do higher discount percentages always lead to higher engagement?
- Which products consistently outperform others in terms of popularity and ratings?

---

## 📊 Key Insights

| Insight Area | Main Finding |
| :--- | :--- |
| **🏆 Niche Dominance** | While *Electronics* has the highest product volume, *Musical Instruments* delivers the **highest average engagement per product**, indicating a high-value niche market. |
| **🏷️ Discount Strategy** | Products with **medium discount levels** generate higher engagement than products with very high discounts, showing diminishing returns on aggressive pricing. |
| **⭐ Brand Power** | *Amazon Basics* products dominate the top engagement rankings, highlighting the role of **brand trust** in driving customer interaction. |

---

## 🛠️ Tech Stack

* **🐍 Python (Pandas, Matplotlib):**  
  Used for data cleaning, preprocessing, feature engineering, and initial exploratory analysis.

* **🐘 PostgreSQL:**  
  Served as the analytical database for aggregation, category analysis, and top-product identification.

* **📊 Power BI:**  
  Used to build an interactive executive dashboard with KPIs, slicers, and comparative visualizations.

---

## 🔄 Project Workflow

### 1️⃣ Data Cleaning & Preprocessing (Python)
- Removed currency symbols (₹) and commas from price columns
- Converted text-based numeric fields into appropriate data types
- Handled missing values in rating counts
- Validated text-heavy columns such as product descriptions

### 2️⃣ Feature Engineering
- Created an **Engagement Score** (`rating × rating_count`)
- Categorized products into price ranges using quantile binning
- Grouped discount percentages into logical discount levels

### 3️⃣ Database Integration
- Migrated the cleaned dataset into PostgreSQL using SQLAlchemy
- Resolved dependency conflicts to ensure clean ingestion
- Created optimized SQL views for dashboard consumption

### 4️⃣ SQL Analytics
- Category-wise engagement analysis
- Identification of top-performing products
- Pre-aggregation of metrics to improve Power BI performance

### 5️⃣ Data Visualization
- Designed a one-page executive dashboard in Power BI
- Included KPI cards, dual-axis charts, and interactive slicers
- Enabled category-level deep-dive analysis

---

## 📂 Project Structure

```text
Amazon-Product-Engagement/
├── amazon_analysis-python.ipynb  # Python pipeline (Cleaning, ETL)
├── amazon.csv                     # Raw dataset
├── postgresql queries.sql         # SQL scripts & Views
├── Dashboard.pbix                 # Power BI Interactive Report
├── Dashboard_Screenshot.png        # Visual preview
├── Project_Report.pdf             # Detailed documentation
└── README.md                      # This file
