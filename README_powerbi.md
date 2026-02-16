# Power BI Dashboard Guide (Procurement Performance)

## 1) Import data
- Open Power BI Desktop
- Get Data → Text/CSV
- Select: data/procurement_data_clean.csv
- Load

## 2) Create Measures (Modeling → New measure)
Total Spend
```DAX
Total Spend = SUM(procurement_data_clean[Actual_Cost])
```

On-Time Delivery %
```DAX
On Time % = DIVIDE(SUM(procurement_data_clean[On_Time]), COUNT(procurement_data_clean[PO_Number]))
```

Average Delay (Days)
```DAX
Avg Delay Days = AVERAGE(procurement_data_clean[Delay_Days])
```

Total Cost Variance
```DAX
Total Cost Variance = SUM(procurement_data_clean[Cost_Variance])
```

## 3) Suggested Dashboard Layout
KPI Cards: Total Spend, On Time %, Avg Delay Days, Total Cost Variance
Charts:
- Bar: Avg Delay Days by Vendor_ID
- Bar: Total Cost Variance by Vendor_ID
- Column: On Time % by Plant
- Line: Total Spend by Month (PO_Date month)

## 4) Slicers
Plant, Vendor_ID, Payment_Term, PO_Date (range)
