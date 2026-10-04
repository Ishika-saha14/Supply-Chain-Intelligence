# 📦 Supply Chain Intelligence
### Sales Performance | Inventory Analytics | Demand Forecasting

An end-to-end data analytics and machine learning project that transforms supply chain data into actionable business insights. This project combines **Python, MySQL, Power BI, and Scikit-learn** to analyze sales performance, monitor inventory health, identify replenishment risks, and predict product demand.

---

## 📌 Project Overview

Effective supply chain management requires a clear understanding of product demand, inventory availability, warehouse performance, and supplier lead times.

This project analyzes daily supply chain data to help answer important business questions:

- Which products and regions generate the highest revenue?
- How do sales and revenue change over time?
- Which inventory records are at or below their reorder points?
- How does inventory vary across warehouses?
- How do supplier lead times compare?
- Can historical data and demand forecasts help predict units sold?

The project demonstrates an end-to-end analytics workflow, from data preparation and exploratory analysis to SQL-based business analysis, interactive dashboard development, and machine learning.

## 🎯 Project Objectives

- Analyze sales, revenue, and product performance.
- Evaluate inventory levels and replenishment indicators.
- Compare performance across regions, warehouses, and SKUs.
- Explore supplier lead times and promotion-related sales patterns.
- Build an interactive Power BI dashboard for business reporting.
- Train and evaluate a machine learning model for demand prediction.
- Translate analytical findings into clear, business-oriented insights.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data preparation, analysis, and visualization |
| Pandas & NumPy | Data manipulation and feature engineering |
| Matplotlib & Seaborn | Exploratory data visualization |
| Jupyter Notebook | Analysis and model development |
| MySQL Workbench | SQL queries and business analysis |
| Power BI | Interactive dashboard and KPI reporting |
| Scikit-learn | Machine learning pipeline and model evaluation |
| Random Forest Regressor | Units-sold prediction |

## 📂 Dataset Overview

The dataset contains daily supply chain records covering **50 SKUs, 5 warehouses, 4 regions, and 10 suppliers** over the period from January 1 to December 30, 2024.

The dataset includes information about:

- Date and product identifiers
- Warehouse, supplier, and region
- Units sold and inventory level
- Supplier lead time
- Reorder point and order quantity
- Unit cost and unit price
- Promotion indicator
- Demand forecast

Additional analytical fields include:

- **Revenue:** Units Sold × Unit Price
- **Inventory Value:** Inventory Level × Unit Cost

*Note: Inventory levels represent daily snapshots. Summing inventory across all dates does not represent the current inventory position.*

## 🔍 Project Workflow

### 1. Data Preparation & Exploratory Data Analysis — Python

Used Python in Jupyter Notebook to inspect and prepare the dataset for analysis.

Key activities:
- Reviewed dataset structure and data types.
- Checked for missing values and duplicate records.
- Created derived revenue and inventory-value fields.
- Explored sales, inventory, product, regional, and warehouse patterns.
- Prepared time-based and historical sales features for machine learning.

### 2. Business Analysis — MySQL

Loaded the dataset into MySQL and performed 14 SQL analysis exercises covering business performance and inventory monitoring.

Key analysis areas:
- Regional sales and revenue comparisons
- Warehouse inventory analysis
- Reorder-point monitoring
- Supplier lead-time analysis
- Top-performing SKUs by revenue
- Inventory-risk classification using `CASE`
- Above-average SKU sales analysis
- Warehouse inventory comparisons
- Common Table Expressions (CTEs)
- Warehouse-level reorder-risk percentages
- Window functions and regional revenue rankings
- SKU contribution to regional revenue
- Promotion versus non-promotion sales comparisons

These queries demonstrate the practical use of aggregation, filtering, joins where applicable, conditional logic, CTEs, and window functions.

### 3. Interactive Dashboard — Power BI

Developed a one-page dashboard titled **Supply Chain Intelligence** to communicate key business metrics and trends.

Dashboard components include:
- Total Units Sold
- Total Revenue
- Latest Inventory Units
- Latest Inventory Value
- Low-Inventory Records
- Monthly sales trend
- Revenue by region
- Latest inventory by warehouse
- Top 10 SKUs by revenue
- Low-inventory records by warehouse
- Region and warehouse slicers

The dashboard brings sales performance and inventory monitoring together in a single reporting view.

**Metric clarification:** Low-inventory records count rows where inventory is at or below the reorder point. They do not represent unique stockout events or confirmed stockouts.

### 4. Machine Learning — Demand Prediction

Developed a supervised machine learning workflow using the **Random Forest Regressor** to predict `Units_Sold`.

The workflow includes:
- Feature engineering using date and historical sales information
- Categorical feature encoding
- Chronological train-test splitting
- Model training using Scikit-learn
- Evaluation using regression metrics
- Permutation importance analysis to explore influential model features

A chronological split was used to better reflect the time-based nature of the prediction task.

#### Model Evaluation

The previously recorded model results are:

| Metric | Result |
|---|---:|
| Mean Absolute Error (MAE) | 2.26 |
| Root Mean Squared Error (RMSE) | 2.84 |
| R² Score | 0.7857 |

**Interpretation:** On the evaluated test set, the model's predictions had a mean absolute error of approximately 2.26 units per record. The R² score indicates that the model explained approximately 78.57% of the target variance on that test set.

These are experimental results from this dataset, not a guarantee of future forecasting performance. They should be reproduced from the final notebook before being treated as verified benchmark results.

## 📊 Key Analytical Findings

- The dataset contains **91,250 records** across the specified period.
- Total recorded units sold: **1,829,979**.
- Total recorded revenue: **33,426,337.22** in the dataset's unspecified currency.
- **5,041 records** were at or below their reorder points.
- Records flagged for promotions had higher average units sold than non-promotion records in the initial analysis.

These findings describe the analyzed dataset. Promotion-related differences indicate an association and do not establish that promotions caused higher sales.

## 💡 Business Value

This project demonstrates how analytics can support supply chain decision-making by:

- Highlighting products that may require inventory review
- Identifying high-revenue products and regions
- Comparing inventory positions across warehouses
- Making supplier lead-time information easier to evaluate
- Providing a consolidated view of sales and inventory KPIs
- Exploring data-driven approaches to demand prediction

The analyses provide decision-support insights; they do not independently establish reductions in stockouts, costs, or excess inventory.

## ⚠️ Limitations & Responsible Interpretation

- Inventory figures must be interpreted according to their snapshot date.
- Reorder-point flags are indicators for review, not proof of stockouts.
- Historical patterns may not represent future demand conditions.
- Model performance depends on data quality and feature availability at prediction time.
- Demand forecast and historical sales features should only be used when they would genuinely be available at the time of prediction.
- Feature importance indicates predictive contribution, not causation.
- Model metrics should be revalidated before operational use.

## 🚀 Future Improvements

- Deploy the trained model through a Streamlit application.
- Publish a shareable Power BI report using appropriate access controls.
- Automate data preparation and model evaluation.
- Monitor model performance as new data becomes available.
- Add inventory replenishment recommendations based on demand, lead time, and reorder policies.
- Document reproducible setup and execution instructions.

## 📁 Repository Structure

The repository may be organized as follows:

```text
Supply-Chain-Intelligence/
├── notebooks/
│   └── Supply Chain Inventory Analysis.ipynb
├── sql/
│   └── supply_chain_analysis.sql
├── dashboard/
│   └── Supply Chain Intelligence.pbix
├── data/
│   └── supply chain data.csv
├── README.md
└── requirements.txt
```

*Adjust this structure to match the files actually present in your repository. Avoid uploading confidential data, credentials, or unnecessary large files.*

## ▶️ Getting Started

### Prerequisites

Install Python and the libraries required for the notebook. MySQL Workbench and Power BI Desktop are needed to reproduce the corresponding SQL and dashboard components.

### Install Python dependencies

After creating a `requirements.txt` file containing the packages your notebook actually uses, run:

```bash
pip install -r requirements.txt
```

### Run the analysis

1. Clone or download this repository.
2. Open the Jupyter Notebook.
3. Configure the dataset path.
4. Run the data preparation and analysis cells in order.
5. Import the dataset into MySQL to execute the SQL analyses.
6. Open the Power BI report in Power BI Desktop, if the `.pbix` file is included.

Database credentials should be supplied securely through environment variables or another local configuration method rather than committed to GitHub.

## 👩‍💻 Skills Demonstrated

**Data Analytics · Data Cleaning · Exploratory Data Analysis · SQL · Business Intelligence · Power BI · Data Visualization · Feature Engineering · Supervised Machine Learning · Model Evaluation · Business Problem Solving**

## 👤 Author

**Ishika Saha**

This project was developed to demonstrate practical data analytics and machine learning skills through a supply chain business case.

---

*If you find this project useful, feel free to explore the notebooks, SQL analyses, and dashboard files included in the repository.*
