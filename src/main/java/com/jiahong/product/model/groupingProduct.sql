CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;

DROP TABLE IF EXISTS product; 

set auto_increment_offset=1;
set auto_increment_increment=1; 

-- product table ------------------------

CREATE TABLE product (

	product_id  INT AUTO_INCREMENT NOT NULL,
	product_user_id INT NOT NULL,
	product_game_id INT NOT NULL,
	product_img TINYTEXT,
    
    CONSTRAINT product_primary_key PRIMARY KEY (product_id)
);

INSERT INTO product (product_user_id, product_game_id, product_img)  VALUES (1, 10, '/oasis/product/resources/productImg/鬥陣特攻.jpg');
INSERT INTO product (product_user_id, product_game_id, product_img)  VALUES (2, 15, '/oasis/product/resources/productImg/生死格鬥.jpg');

-- order table ------------------------
-- item table ------------------------
-- spec table ------------------------
-- comment table ------------------------
-- description table ------------------------

USE oasis;
SELECT * FROM product;
