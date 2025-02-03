-- ALL DML Commands

INSERT INTO Users (user_id, username, email, phone_number,address)
VALUES (11, 'Mayan', ',mayan@gmail.com', '1234567890','Raniban');

INSERT INTO Category (category_id, category_name)
VALUES (2, 'Laptops');

INSERT INTO Sub_Category (subcategory_id, category_id, sub_category_name)
VALUES (2, 2, 'DELL');

INSERT INTO Articles (article_id, article_name, stock, rating_number, sub_category_id, description, price)
VALUES (2, 'DELL', 'In Stock', 4.5, 1, 'Latest laptop model', 99999.99);


INSERT INTO Cart (cart_id, user_id, article_id, article_quantity)
VALUES (2, 10, 2, 1);

INSERT INTO Orders (order_id, cart_id, user_id, cart_date, status, shipping_address, payment_method)
VALUES (2, 2, 10, TO_DATE('2025-01-19', 'YYYY-MM-DD'), 'Shipped', '123 Main St, City, Country', 'Credit Card');
INSERT INTO Orders (order_id, cart_id, user_id, cart_date, status, shipping_address, payment_method)
VALUES (3, 2, 10, TO_DATE('2025-02-03', 'YYYY-MM-DD'), 'Cancelled', 'Raniban', 'Cash on delibery');

SELECT * FROM Users;
SELECT * FROM Category;
SELECT * FROM Sub_Category;
SELECT * FROM Articles;
SELECT * FROM Cart;
SELECT * FROM Orders;

SELECT o.order_id, o.status, u.username
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
WHERE u.username LIKE 'A%';

SELECT o.*
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
WHERE u.username LIKE 'A%';



-- Update User's phone number
UPDATE Users 
SET phone_number = '9876743210' 
WHERE user_id = 10;

-- Update category name
UPDATE Category 
SET category_name = 'Mobile Phone' 
WHERE category_id = 1;

-- Update stock of the article
UPDATE Articles 
SET stock = 'Out of Stock', price = 94999.99 
WHERE article_id = 2;

-- Update order status
UPDATE Orders 
SET status = 'Delivered' 
WHERE order_id = 2;


UPDATE Users 
SET address = 'Balaju'
WHERE user_id IN (
    SELECT DISTINCT user_id 
    FROM Orders 
    WHERE status = 'Delivered'
);

Select *  from Users;





