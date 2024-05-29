CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;

DROP TABLE IF EXISTS product; 
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS item; 

set auto_increment_offset=1;
set auto_increment_increment=1; 

-- product table ------------------------

CREATE TABLE product (
    product_id  INT AUTO_INCREMENT NOT NULL,
    product_user_id INT NOT NULL,
    product_user_company_name VARCHAR(255) NOT NULL,
    product_game_name VARCHAR(255) NOT NULL,
    product_img TINYTEXT,
    product_name VARCHAR(20),
    product_description VARCHAR(255),    
    product_price INT NOT NULL,
    CONSTRAINT product_primary_key PRIMARY KEY (product_id) 
);

INSERT INTO product (product_user_id, product_user_company_name, product_game_name, product_img, product_name, product_description, product_price)  
VALUES ('16', 'Blizzard', '鬥陣特攻', '/oasis/product/resources/productImg/鬥陣特攻產品圖.jpg', '鬥陣特攻遊戲主程式', '《鬥陣特攻 2》是一款廣受好評的團隊取向射擊遊戲，故事背景設定在樂觀的未來時代，並且有持續成長的英雄陣容。立即與好友組隊，體驗刺激的戰鬥。', 1249);
INSERT INTO product (product_user_id, product_user_company_name, product_game_name, product_img, product_name, product_description, product_price)  
VALUES ('15',  'Nintendo', '動物森友會', '/oasis/product/resources/productImg/動物森友會產品圖.jpg', '動物森友會遊戲片', '參與無人島移居計畫展開全新的生活\n試試來無人島生活嗎 全新改造系統 讓玩家自己製作各種家具及道具\n園藝釣魚探索環境佈置與可愛動物交流等著你來體驗 生活的記錄就交給Nook Inc.吧', 1290);

-- orders table ------------------------

CREATE TABLE orders (
    orders_id INT AUTO_INCREMENT NOT NULL,  
    orders_user_id INT NOT NULL, 
    orders_user_realName VARCHAR(255) NOT NULL,  
    orders_user_cellphone VARCHAR(255) NOT NULL,  
    orders_user_address VARCHAR(255) NOT NULL,
    orders_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    orders_total INT NOT NULL,
    
    CONSTRAINT orders_primary_key PRIMARY KEY (orders_id)  
);

INSERT INTO orders (orders_user_id, orders_user_realName, orders_user_cellphone, orders_user_address, orders_total)  
VALUES (1, '賴柏安', '0963929616', '台北市文山區溪州街', 1249);
INSERT INTO orders (orders_user_id, orders_user_realName, orders_user_cellphone, orders_user_address, orders_total)  
VALUES (9, 'Peter Parker', '0987654321', '美國紐約市皇后區', 2539);

-- item table ------------------------
CREATE TABLE item (
    item_id INT AUTO_INCREMENT NOT NULL,
    item_orders_id INT NOT NULL, 
    item_game_id INT NOT NULL, 
    item_product_id INT NOT NULL,
    item_game_name VARCHAR(20) NOT NULL,  
	item_count INT NOT NULL,
    item_order_price INT NOT NULL, 
    item_order_total INT NOT NULL,  

    CONSTRAINT item_primary_key PRIMARY KEY (item_id)

);

INSERT INTO item (item_orders_id, item_game_id, item_product_id, item_game_name, item_count, item_order_price, item_order_total)  
VALUES (1, '11', '16', '鬥陣特攻', 1, 1249, 1249);
INSERT INTO item (item_orders_id, item_game_id, item_product_id, item_game_name, item_count, item_order_price, item_order_total)  
VALUES (2, '11',  '16','鬥陣特攻', 1, 1249, 2539);
INSERT INTO item (item_orders_id, item_game_id, item_product_id, item_game_name, item_count, item_order_price, item_order_total)  
VALUES (2, '10',  '15','動物森友會', 1, 1290, 2539);


-- spec table ------------------------
-- comment table ------------------------
-- description table ------------------------

USE oasis;
SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM item;
