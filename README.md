# -From-Dough-to-Data-Building-the-Butter-Salt-Cookie-Database


## 1. What This Project Is
The Butter & Salt Database Capstone Project is a real-world database system created for my home-based cookie business, using fully anonymized and simulated data for privacy. Developed for the APCV 498 Senior Capstone course, this project demonstrates an end-to-end design of a functional relational database—from schema creation to data population to analytical SQL queries. Its purpose is to show how small businesses can use structured data to understand performance, track orders and customers, and make informed operational decisions. The primary audience for this project is my professor and classmates reviewing database design and implementation.

## 2. What’s Included in This Project
### SQL Folder
 Contains all SQL scripts used to build and analyze the database.
- Database creation scripts – Creates the Butter & Salt database environment.
- Table creation & normalization scripts – Defines all 3NF-normalized tables (customers, orders, cookies, ingredients, etc.).
- Data import scripts – SQL INSERT queries used to populate each table with mock data.
- Business insight queries – Analytical SQL queries that pull meaningful insights (e.g., sales trends, repeat customers, revenue patterns).

### CSV Folder
Includes all mock data files used to populate the database:
- CSV files for each table – Contains simulated data for customers, orders, cookies, ingredients, inventory, and other business entities.
- These files allow the database to be populated quickly without manual entry.

### Images Folder
Contains visual and presentation assets:
- Project poster – High-level visual summary of the capstone project.
- Schema diagram – Visual layout of tables and relationships.
- ERD diagram – Entity–Relationship Diagram showing the full structure.
- Data visualizations – Graphs and charts generated from SQL business insight queries (e.g., sales trends, customer patterns).

### Query Results Folder
Stores output files created by running analytical queries:
- Monthly sales revenue results
- Repeat customer analysis
- Other query output files or screenshots
- These demonstrate how the database answers real business questions.

## 3. Overview of the Database
- The database has 7 tables  
- It stores cookies, customers, orders, order items, and more  
- Tables are connected using primary keys and foreign keys  
- It allows reporting on sales, trends, and customer patterns  

## 4. How to Use This Project
1. Open MySQL Workbench.
2. Run the schema file located in /SQL (01_schema.sql).
3. Run the data insertion file (02_insert_data.sql).
4. Execute the stored procedures and example queries in /SQL or /Query Results.


## 5. What This Project Can Do
- Shows most popular cookies  
- Shows low-sales months  
- Tracks customer order habits  
- Helps plan for production and marketing  

## 6. Tools Used
- MySQL Workbench  
- Mockaroo (for sample data)  
- Canva (for charts)  

## 7. References
Canva. (2025). Charts and Graph Creator. https://www.canva.com  
MySQL Documentation. (2024). MySQL Reference Manual. https://dev.mysql.com/doc  
Mockaroo. (2025). Random Data Generator. https://www.mockaroo.com  

