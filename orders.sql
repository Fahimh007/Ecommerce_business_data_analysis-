-- database: :memory:
-- 1. Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;


-- 2. Total Sales
SELECT SUM("Net_Amount") AS total_sales
FROM orders;


-- 3. Top Products by Sales
SELECT
    "Product",
    SUM("Net_Amount") AS total_sales
FROM orders
GROUP BY "Product"
ORDER BY total_sales DESC;


-- 4. Top Cities by Sales
SELECT
    "City",
    SUM("Net_Amount") AS total_sales
FROM orders
GROUP BY "City"
ORDER BY total_sales DESC;


-- 5. Monthly Sales
SELECT
    "Year",
    "Month",
    SUM("Net_Amount") AS total_sales
FROM orders
GROUP BY "Year", "Month"
ORDER BY
    "Year",
    CASE "Month"
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;


-- 6. Highest Profit Products
SELECT
    "Product",
    SUM("Profit") AS total_profit
FROM orders
GROUP BY "Product"
ORDER BY total_profit DESC;


-- 7. Orders by Payment Mode
SELECT
    "Payment_Mode",
    COUNT(*) AS total_orders
FROM orders
GROUP BY "Payment_Mode"
ORDER BY total_orders DESC;


-- 8. Cancelled Orders
SELECT *
FROM orders
WHERE "Order_Status" = 'Cancelled';
