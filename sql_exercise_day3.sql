
--
-- SQL Query
--


-- using the DDL in the file final_exercise_ddl.sql, perfom the following - 


-- DQL Tasks

-- 1) How many orders were received for products with a category_id = 2

SELECT COUNT(*) FROM orders WHERE category_id = 2;

23

-- 2) How many orders were received with a category_id of either 2, 4, or 5

SELECT COUNT(*) FROM orders WHERE category_id IN (2,4,5);

66

-- 3) How many order are there with a price over £35.00 

SELECT COUNT(*) FROM orders WHERE price > 35;

71

-- 4) How many orders are there where the customer has a date of birth before 1st January 1980 and want to receive the newsletter

SELECT COUNT(*) FROM orders WHERE date_of_birth < '1980-01-01' AND newsletter = '1';

36

-- 5)  How many customers named Davenport placed orders?

SELECT COUNT(*) FROM orders WHERE customer_surname LIKE '%Davenport%' or customer_firstname LIKE '%Davenport%';

7

-- 6) Which customer with a firstname starting with 'Br', had the most orders

SELECT customer_firstname, number from
(
 select customer_firstname as customer_firstname,COUNT(*) as number
  FROM orders GROUP BY customer_firstname 
) b
  WHERE customer_firstname LIKE 'Br%';

Bradley, Brenda, Brendan, Brielle

-- 7) List all orders with products from category 3 by order of price, highest first.

SELECT * FROM orders WHERE category_id = 3 ORDER BY CONVERT(price,DECIMAL(5,2)) DESC;

-- 8) Select the following fields from all orders (trans_date, price, promo_code) renaming the colum (field) headings ('Transaction Date', 'Price' & 'Promotion Code')

SELECT trans_date as 'Transaction Date', price as 'Price', promo_code as 'Promotion Code' FROM orders;

-- 9) Select the following fields (customer_surname, customer_firstname, county) from all orders, with customer names in a single field named 'Customer Name' and in the format <Surname>, <Firstname>, with surname capitalised.  The county field is to be renamed 'County'.

SELECT CONCAT(UPPER(customer_surname),',',customer_firstname) as 'Name', county as 'County' FROM orders;

-- 10)	Select the average price, minimum price & maximum price for each category.

SELECT category_id, ROUND(AVG(price),2) as 'Round Average Price', MAX(price) as 'Maxmum Price', MIN(price) as 'Minimum Price' FROM orders GROUP BY category_id;

-- 11) 	Select the category_name (labelled 'Category', number of sales (labelled 'Total Orders') & total sales (labelled 'Total Sales') for each category.

SELECT category_name as 'Category', COUNT(*) as 'Total Orders', SUM(CONVERT(price,DECIMAL(5,2))) as 'TOTAL SALES' FROM orders JOIN categories ON (orders.category_id=categories.id) GROUP BY category_id;

-- 12) 	List all orders with the following fields (with the labls given) orders.trans_date('Transaction Date'), categories.category_name('Category'), orders.customer_surname('Surname'), orders.customer_firstname('Firstname'), orders.price('Order Price'), categories.category_name('Category'), promotions.discount('Discounted by') 

SELECT orders.trans_date as 'Transaction Date', categories.category_name as 'Category', orders.customer_surname as 'Surname', orders.customer_firstname as 'Firstname', orders.price as 'Order Price', promotions.discount as 'Discount by' FROM orders LEFT JOIN categories ON (orders.category_id = categories.id) LEFT JOIN promotions ON (orders.promo_code = promotions.code);