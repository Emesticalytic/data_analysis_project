Data Analysis Project
A complete end-to-end data analysis pipeline built in R, covering all four types of business analytics using retail data across employees, customers, products, orders and sales.

Business Question

Which customers are at risk of churning?
which products drive the most revenue?
and what actions should the business take to grow?


Dataset
PropertyDetailsSourceCustom generated — mirrors real retail business dataToolR (tidyverse, ggplot2, caret, dplyr, scales, forcats)Tablesemployees, customers, products, orders, salesRecords15 employees · 15 customers · 15 products · 15 orders · 20 salesPeriodSeptember to December 2024

Project Structure
data_analysis_project/
│
├── data/
│   ├── raw/                        # original generated datasets (CSV)
│   └── clean/                      # processed, analysis-ready datasets
│
├── scripts/
│   ├── 01_setup.R                  # install packages, create folders
│   ├── 02_create_data.R            # generate all 5 datasets
│   ├── 03_descriptive.R            # summary stats, monthly revenue, top products
│   ├── 04_diagnostic.R             # churn analysis, order status breakdown
│   ├── 05_predictive.R             # customer risk scoring
│   ├── 06_prescriptive.R           # recommended offers, stock alerts
│   ├── README.md                   # this file
│   └── requirements.txt            # all R packages required
│
├── plots/                          # all charts saved as PNG (150 DPI)
├── reports/                        # CSV summaries and executive summary
└── main.R                          # master script — runs entire pipeline

How To Run
Prerequisites

R version 4.1 or higher
RStudio (recommended)
Internet connection for first-time package installation

Step 1 — Clone the repo
bashgit clone https://github.com/yourusername/data_analysis_project.git
cd data_analysis_project
Step 2 — Open RStudio and set working directory
rsetwd("path/to/data_analysis_project")
Step 3 — Run the full pipeline
rsource("main.R")
Step 4 — Check outputs

plots/ — 6 charts saved as PNG
reports/ — CSV summaries and executive summary
data/clean/ — cleaned and feature-engineered datasets


Analysis Types Covered
TypeScriptWhat It DoesDescriptive03_descriptive.RMonthly revenue, top products, salary distributionDiagnostic04_diagnostic.RChurn by tier, order status, city breakdownPredictive05_predictive.RCustomer risk scores (rule-based for small dataset)Prescriptive06_prescriptive.RRecommended offers, stock reorder alerts

R Packages Required
rinstall.packages(c(
  "tidyverse",   # core data manipulation
  "ggplot2",     # charts and visualisation
  "dplyr",       # data wrangling
  "caret",       # machine learning pipeline
  "scales",      # chart axis formatting
  "forcats"      # factor reordering for plots
))
All packages are also listed in scripts/requirements.txt.

Key Findings

October 2024 was the highest revenue month at £1,109
Standing Desk and Ergonomic Office Chair are the top 2 revenue products
Platinum and Gold customers (33% of base) drive the majority of revenue
1 customer churned (6.7% churn rate) — Patricia Kimani, Bronze tier
3 customers are at Critical or High risk of churning and need immediate action
80% delivery rate across all orders


Charts Produced
FileDescription01_monthly_revenue.pngBar chart — revenue by month02_top_products.pngHorizontal bar — top 5 products by revenue03_salary_distribution.pngHistogram — salary by department04_churn_by_tier.pngBar chart — churn rate by customer tier05_order_status.pngBar chart — order status distribution06_churn_risk.pngBar chart — customer risk scores with recommended offers

Known Issues

The predictive model uses rule-based scoring rather than a statistical model because the dataset has only 15 customers. A minimum of 100+ rows is needed for meaningful ML modelling.
All file paths use relative references. Always run scripts from the project root directory.
The native pipe |> requires R 4.1+. If using an older version replace |> with %>% and load library(magrittr).


Project Info
LanguageRPurposePortfolio project — Month 1-2 Data Science Roadmap Licence MIT — free to use and adapt Author: Emem Akpan
