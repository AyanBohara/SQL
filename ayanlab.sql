CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    birth_date DATE
);

CREATE TABLE Admin (
    admin_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Sub_Category (
    subcategory_id INT PRIMARY KEY,
    category_id INT NOT NULL,
    sub_category_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Articles (
    article_id INT PRIMARY KEY,             -- Primary key for Articles
    article_name VARCHAR(100) NOT NULL,     -- Name of the article
    stock VARCHAR(50) NOT NULL,             -- Stock information
    rating_number NUMBER(3, 2),             -- Rating for the article (up to 3 digits, 2 decimals)
    sub_category_id INT NOT NULL,           -- Foreign key referencing Sub_Category
    description VARCHAR(50),                       -- Description of the article
    price NUMBER(10, 2),                    -- Price of the article
    FOREIGN KEY (sub_category_id) REFERENCES Sub_Category(subcategory_id)
);

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY,                -- Primary key for Cart
    user_id INT NOT NULL,                   -- Foreign key referencing Users
    article_id INT NOT NULL,                -- Foreign key referencing Articles
    article_quantity INT NOT NULL,          -- Quantity of the article in the cart
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (article_id) REFERENCES Articles(article_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,               -- Primary key for Order_Table
    cart_id INT NOT NULL,                   -- Foreign key referencing Cart
    user_id INT NOT NULL,                   -- Foreign key referencing Users
    cart_date DATE NOT NULL,                -- Date when the order was created
    status VARCHAR(50),                     -- Status of the order
    shipping_address VARCHAR(50),                  -- Shipping address for the order
    payment_method VARCHAR(50),             -- Payment method used
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Article_Review (
    review_id INT PRIMARY KEY,              -- Primary key for Article_Review
    article_id INT NOT NULL,                -- Foreign key referencing Articles
    user_id INT NOT NULL,                   -- Foreign key referencing Users
    review_title VARCHAR(50),              -- Title of the review
    review_body VARCHAR(100),                       -- Body of the review
    review_rating NUMBER(3, 2),             -- Rating given in the review (up to 3 digits, 2 decimals)
    review_date DATE,                       -- Date of the review
    FOREIGN KEY (article_id) REFERENCES Articles(article_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Messages (
    m_id INT PRIMARY KEY,                      -- Unique ID for each message
    m_title VARCHAR(255) NOT NULL,              -- Title of the message
    m_feedback VARCHAR(1000),                   -- Feedback or content of the message
    user_id INT NOT NULL,                       -- User who sent the message (foreign key)
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Foreign key to Users table
);

//Alert
ALTER TABLE Users
MODIFY address VARCHAR(100);

--ALTER TABLE Messages
--MODIFY m_title VARCHAR(50) NOT NULL;
ALTER TABLE Messages
MODIFY m_title VARCHAR(50);

ALTER TABLE Messages
ADD CONSTRAINT unique_feedback UNIQUE (m_feedback);

ALTER TABLE Users
DROP COLUMN address;

Desc Users;
ALTER TABLE Messages
DROP CONSTRAINT unique_feedback;
Desc Messages;








