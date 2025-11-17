-- customers csv import 
-- =======================
LOAD DATA LOCAL INFILE '/Users/breannajordan/Downloads/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(first_name, last_name, email, phone, created_at);


-- cookies csv import
-- ==========================
LOAD DATA LOCAL INFILE '/Users/breannajordan/Downloads/cookies .csv'
INTO TABLE cookies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cookie_name, category, unit_price, active);


-- ingredient csv import
-- ==========================
LOAD DATA LOCAL INFILE '/Users/breannajordan/Downloads/ingredients(measurements).csv'
INTO TABLE ingredients
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ingredient_name, unit, current_qty, reorder_level);

-- orders csv import 
-- ========================
LOAD DATA LOCAL INFILE '/Users/breannajordan/Downloads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, order_date, order_status, subtotal, tax, total);

-- order_items imports 
-- ============================
LOAD DATA LOCAL INFILE '/Users/breannajordan/Downloads/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, cookie_id, quantity, unit_price);

-- recipes csv import
-- ====================
LOAD DATA LOCAL INFILE '/Users/breannajordan/Downloads/recipes.csv'
INTO TABLE recipes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cookie_id, yield_qty);

-- recipe_items csv import 
-- ==============================
LOAD DATA LOCAL INFILE '/Users/breannajordan/Downloads/recipe_items.csv'
INTO TABLE recipe_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(recipe_id, ingredient_id, amount_per_batch);




-- Added a few more entries to recipe_items table
-- =============================================
USE butter_salt;
INSERT INTO recipe_items (recipe_id, ingredient_id, amount_per_batch)
VALUES
(1, 4, 2.50),
(1, 5, 1.00),
(2, 1, 3.25),
(2, 3, 1.50);

USE butter_salt;
SELECT o.order_id, c.first_name, c.last_name, SUM(oi.line_total) AS order_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.first_name, c.last_name
LIMIT 10;