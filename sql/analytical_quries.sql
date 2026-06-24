-- 1. Top 5 funds by AUM
SELECT *
FROM fact_aum
ORDER BY aum DESC
LIMIT 5;

-- 2. Average NAV per month
SELECT
strftime('%Y-%m', date) AS month,
AVG(nav) AS avg_nav
FROM nav_history
GROUP BY month
ORDER BY month;

-- 3. SIP Year-over-Year Growth
SELECT
strftime('%Y', transaction_date) AS year,
SUM(amount) AS total_sip_amount
FROM investor_transactions
WHERE transaction_type = 'SIP'
GROUP BY year
ORDER BY year;

-- 4. Transactions by State
SELECT
state,
COUNT(*) AS total_transactions
FROM investor_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- 5. Funds with Expense Ratio < 1%
SELECT *
FROM scheme_performance
WHERE expense_ratio < 1;

-- 6. Top 10 Funds by 1-Year Return
SELECT
scheme_name,
return_1yr
FROM scheme_performance
ORDER BY return_1yr DESC
LIMIT 10;

-- 7. Average Expense Ratio by Category
SELECT
category,
AVG(expense_ratio) AS avg_expense_ratio
FROM scheme_performance
GROUP BY category;

-- 8. Number of Funds by Risk Category
SELECT
risk_category,
COUNT(*) AS total_funds
FROM fund_master
GROUP BY risk_category;

-- 9. Highest NAV Recorded
SELECT
amfi_code,
MAX(nav) AS highest_nav
FROM nav_history
GROUP BY amfi_code
ORDER BY highest_nav DESC;

-- 10. Monthly Transaction Volume
SELECT
strftime('%Y-%m', transaction_date) AS month,
COUNT(*) AS transaction_count
FROM investor_transactions
GROUP BY month
ORDER BY month;