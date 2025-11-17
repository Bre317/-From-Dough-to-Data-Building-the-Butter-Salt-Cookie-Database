-- Best selling cookie sold by Quanity 
-- Shows the most popular cookies based on total units sold.
-- =====================================
SELECT 
    ck.cookie_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN cookies ck ON oi.cookie_id = ck.cookie_id
GROUP BY ck.cookie_name
ORDER BY total_sold DESC
LIMIT 5;

-- Top 5 Revenue-Generating Cookies
-- Identifies which cookies drive the most sales revenue.
-- =======================================================
SELECT 
    ck.cookie_name,
    ROUND(SUM(oi.line_total), 2) AS total_revenue
FROM order_items oi
JOIN cookies ck ON oi.cookie_id = ck.cookie_id
GROUP BY ck.cookie_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Repeat Customers
-- Recognizes loyal customers who have placed multiple orders — useful for loyalty programs.
-- =========================================================================================
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING total_orders > 1
ORDER BY total_orders DESC;


-- Low-Stock Ingredients (Below Reorder Level)
-- Alerts when ingredients need reordering to avoid running out mid-production.
-- =============================================================================
SELECT 
    ingredient_name,
    current_qty,
    reorder_level
FROM ingredients
WHERE current_qty <= reorder_level
ORDER BY ingredient_name;

-- Monthly Sales Summary
-- Helps track sales growth and seasonality trends over time.
-- ==========================================================
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total), 2) AS total_revenue
FROM orders
WHERE order_status IN ('Paid', 'Shipped')
GROUP BY month
ORDER BY month;

-- Average Order Value (AOV)
-- Measures how much customers typically spend per order 
--  a key metric for marketing and promotions.
-- ===========================================================
SELECT 
    ROUND(AVG(total), 2) AS avg_order_value
FROM orders
WHERE order_status IN ('Paid', 'Shipped');

-- Top 5 Customers by Total Spend
-- Identifies VIP customers 
-- ideal for targeted thank-you campaigns or early access offers.
-- ==============================================================
SELECT 
    c.first_name,
    c.last_name,
    ROUND(SUM(o.total), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Order Breakdown: Total Cookies Sold Per Order
-- Displays customer orders with cookie quantities and spend 
-- Helps understand purchasing patterns.
-- =================================================
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity) AS total_cookies,
    ROUND(SUM(oi.line_total), 2) AS total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.first_name, c.last_name
ORDER BY total_amount DESC
LIMIT 10;

-- Most Recent Orders
-- Displays the latest activity to monitor current operations or verify that imports were successful.
-- ========================================================
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    DATE(o.order_date) AS order_date,
    ROUND(o.total, 2) AS total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC
LIMIT 10;
