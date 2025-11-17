-- ==========================================================
--  Butter & Salt Database (Normalized up to 3NF)
--  Author: Breanna Jordan
-- ==========================================================

--  Drop old database if it exists
DROP DATABASE IF EXISTS butter_salt;
CREATE DATABASE butter_salt CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE butter_salt;

-- ==========================================================
-- 1. CUSTOMERS
-- ==========================================================
CREATE TABLE customers (
    customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================================
-- 2. ORDERS
-- ==========================================================
CREATE TABLE orders (
    order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_id INT UNSIGNED NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_status ENUM('Pending','Paid','Shipped','Cancelled') DEFAULT 'Pending',
    subtotal DECIMAL(10,2) DEFAULT 0.00,
    tax DECIMAL(10,2) DEFAULT 0.00,
    total DECIMAL(10,2) DEFAULT 0.00,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ==========================================================
-- 3. COOKIES (PRODUCTS)
-- ==========================================================
CREATE TABLE cookies (
    cookie_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cookie_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) DEFAULT 'Classic',
    unit_price DECIMAL(10,2) NOT NULL,
    active TINYINT(1) DEFAULT 1
);

-- ==========================================================
-- 4. ORDER_ITEMS (JUNCTION TABLE)
-- ==========================================================
CREATE TABLE order_items (
    order_id INT UNSIGNED NOT NULL,
    cookie_id INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    line_total DECIMAL(10,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    PRIMARY KEY (order_id, cookie_id),
    CONSTRAINT fk_oi_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_oi_cookie
        FOREIGN KEY (cookie_id)
        REFERENCES cookies(cookie_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ==========================================================
-- 5. INGREDIENTS
-- ==========================================================
CREATE TABLE ingredients (
    ingredient_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(100) NOT NULL,
    unit VARCHAR(20) NOT NULL,                 -- grams, cups, etc.
    current_qty DECIMAL(10,2) DEFAULT 0.00,
    reorder_level DECIMAL(10,2) DEFAULT 0.00
);

-- ==========================================================
-- 6. RECIPES
-- ==========================================================
CREATE TABLE recipes (
    recipe_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cookie_id INT UNSIGNED NOT NULL UNIQUE,
    yield_qty INT UNSIGNED NOT NULL,           -- cookies per batch
    CONSTRAINT fk_recipes_cookie
        FOREIGN KEY (cookie_id)
        REFERENCES cookies(cookie_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ==========================================================
-- 7. RECIPE_ITEMS (JUNCTION TABLE)
-- ==========================================================
CREATE TABLE recipe_items (
    recipe_id INT UNSIGNED NOT NULL,
    ingredient_id INT UNSIGNED NOT NULL,
    amount_per_batch DECIMAL(10,2) NOT NULL,   -- e.g., 5c of flour per batch
    PRIMARY KEY (recipe_id, ingredient_id),
    CONSTRAINT fk_ri_recipe
        FOREIGN KEY (recipe_id)
        REFERENCES recipes(recipe_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_ri_ingredient
        FOREIGN KEY (ingredient_id)
        REFERENCES ingredients(ingredient_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);





