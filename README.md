Procurement Performance Analysis (SAP MM Simulation)

Project Overview
This project analyzes procurement performance using simulated SAP MM-style data.  
The goal is to evaluate vendor reliability, delivery performance, and cost variance using SQL, Python, and Power BI.

Business Problem
Procurement teams often struggle with:
- Late supplier deliveries
- Cost overruns
- Lack of structured vendor performance tracking

This project demonstrates how structured data analysis can support better vendor decisions and operational planning.

Tools Used
- SQL (performance KPI queries)
- Python (data cleaning & transformation)
- Power BI (dashboard visualization)
- Simulated SAP MM procurement dataset

Key KPIs Analyzed
- On-Time Delivery %
- Average Delivery Delay (Days)
- Total Procurement Spend
- Cost Variance
- Vendor Performance Score

Insights
- Identified vendors with highest delay frequency
- Detected cost variance patterns across plants
- Measured delivery reliability using structured KPIs
- Proposed vendor scorecard model

Project Structure
- `clean_data.py` → Data cleaning & feature engineering
- `queries.sql` → KPI analysis queries
- `procurement_data_raw.csv` → Simulated SAP dataset
- `procurement_data_clean.csv` → Processed dataset
- `load_to_sqlite.py` → SQL database integration

What This Demonstrates
- End-to-end analytics workflow
- Business-oriented KPI analysis
- SAP MM process understanding
- Structured data engineering
- Dashboard-ready dataset preparation
