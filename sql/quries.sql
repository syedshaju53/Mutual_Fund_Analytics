-- 1. Top 5 Fund Houses by AUM

SELECT
    fund_house,
    aum_lakh_crore
FROM aum_by_fund_house
ORDER BY aum_lakh_crore DESC
LIMIT 5;


-- 2. Average NAV by AMFI Code

SELECT
    amfi_code,
    ROUND(AVG(nav),2) AS avg_nav
FROM nav_history
GROUP BY amfi_code
ORDER BY avg_nav DESC;


-- 3. Monthly Average NAV

SELECT
    substr(date,1,7) AS month,
    ROUND(AVG(nav),2) AS avg_nav
FROM nav_history
GROUP BY substr(date,1,7)
ORDER BY month;


-- 4. SIP YoY Growth Trend

SELECT
    month,
    yoy_growth_pct
FROM monthly_sip_inflows
ORDER BY month;


-- 5. Transactions by State

SELECT
    state,
    COUNT(*) AS total_transactions
FROM investor_transactions
GROUP BY state
ORDER BY total_transactions DESC;


-- 6. Funds with Expense Ratio Less Than 1%

SELECT
    scheme_name,
    fund_house,
    expense_ratio_pct
FROM scheme_performance
WHERE expense_ratio_pct < 1
ORDER BY expense_ratio_pct;


-- 7. Top 10 Funds by 5-Year Return

SELECT
    scheme_name,
    return_5yr_pct
FROM scheme_performance
ORDER BY return_5yr_pct DESC
LIMIT 10;


-- 8. Average Return by Category

SELECT
    category,
    ROUND(AVG(return_3yr_pct),2) AS avg_3yr_return
FROM scheme_performance
GROUP BY category
ORDER BY avg_3yr_return DESC;


-- 9. Fund Houses with Highest Number of Schemes

SELECT
    fund_house,
    COUNT(*) AS total_schemes
FROM fund_master
GROUP BY fund_house
ORDER BY total_schemes DESC;


-- 10. Top Sectors by Portfolio Weight

SELECT
    sector,
    ROUND(SUM(weight_pct),2) AS total_weight
FROM portfolio_holdings
GROUP BY sector
ORDER BY total_weight DESC;