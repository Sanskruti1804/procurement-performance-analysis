-- SQL Queries (SQLite)
-- 1) On-Time Delivery Rate
SELECT 
  COUNT(*) AS total_orders,
  SUM(CASE WHEN date(Delivery_Date) <= date(Planned_Delivery_Date) THEN 1 ELSE 0 END) AS on_time_deliveries,
  ROUND(
    SUM(CASE WHEN date(Delivery_Date) <= date(Planned_Delivery_Date) THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS on_time_percentage
FROM procurement;

-- 2) Average Delay (days) by Vendor
SELECT 
  Vendor_ID,
  ROUND(AVG(julianday(Delivery_Date) - julianday(Planned_Delivery_Date)), 2) AS avg_delay_days,
  COUNT(*) AS orders
FROM procurement
GROUP BY Vendor_ID
ORDER BY avg_delay_days DESC;

-- 3) Cost Variance by Vendor
SELECT
  Vendor_ID,
  ROUND(SUM(Actual_Cost - Planned_Cost), 2) AS total_cost_variance,
  ROUND(AVG(Actual_Cost - Planned_Cost), 2) AS avg_cost_variance
FROM procurement
GROUP BY Vendor_ID
ORDER BY total_cost_variance DESC;

-- 4) Delay by Plant
SELECT
  Plant,
  ROUND(AVG(julianday(Delivery_Date) - julianday(Planned_Delivery_Date)), 2) AS avg_delay_days,
  ROUND(
    SUM(CASE WHEN date(Delivery_Date) <= date(Planned_Delivery_Date) THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS on_time_percentage
FROM procurement
GROUP BY Plant;

-- 5) Monthly Spend Trend
SELECT
  strftime('%Y-%m', PO_Date) AS month,
  ROUND(SUM(Actual_Cost), 2) AS total_spend
FROM procurement
GROUP BY month
ORDER BY month;
