CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;

DROP TABLE IF EXISTS product; 
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS item; 

set auto_increment_offset=1;
set auto_increment_increment=1; 

-- product table ------------------------
CREATE TABLE product (
    product_id  INT AUTO_INCREMENT NOT NULL,
    product_user_id INT NOT NULL,
    product_user_company_name VARCHAR(255) NOT NULL,
    product_game_id INT NOT NULL,
    product_game_name VARCHAR(255) NOT NULL,
    product_img TINYTEXT,
    product_name VARCHAR(20),
    product_description VARCHAR(255),    
    product_price INT NOT NULL,
    CONSTRAINT product_primary_key PRIMARY KEY (product_id) 

);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (16, 'Blizzard',  11, '鬥陣特攻', '/oasis/product/resources/productImg/鬥陣特攻產品圖片.jpg', '鬥陣特攻遊戲主程式', '《鬥陣特攻 2》是一款廣受好評的團隊取向射擊遊戲，故事背景設定在樂觀的未來時代，並且有持續成長的英雄陣容。立即與好友組隊，體驗刺激的戰鬥。', 1249);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (16, 'Blizzard',  11, '鬥陣特攻', '/oasis/product/resources/productImg/鬥陣特攻天照大神霧子造型圖片.jpg', '鬥陣特攻天照大神霧子造型', '《鬥陣特攻2》新賽季也就是第三賽季將在台灣時間 2 月 8 日凌晨登場，本賽季將會新增地圖以及大量更新內容，官方宣布將會啟用舊鬥陣幣並降低造型價格，傳奇造型均 1500 鬥陣幣外，舊鬥陣幣也能直接購買新造型與活動節慶造型，並將讓免費通行證增加共 1500 舊鬥陣幣的獎勵，第三季神話造型為「天照大神」霧子。', 1500);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (16, 'Blizzard',  11, '鬥陣特攻', '/oasis/product/resources/productImg/鬥陣特攻保時捷DVA造型圖片.jpg', '鬥陣特攻保時捷DVA造型', '我們將在第 10 賽季與保時捷合作推出新的遊戲內活動，帶來以全新 Macan Electric 為靈感來源的 D.Va 傳奇造型！', 2500);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (15, 'Nintendo', 10, '動物森友會', '/oasis/product/resources/productImg/動物森友會產品圖片.jpg', '動物森友會遊戲片', '參與無人島移居計畫展開全新的生活\n試試來無人島生活嗎 全新改造系統 讓玩家自己製作各種家具及道具\n園藝釣魚探索環境佈置與可愛動物交流等著你來體驗 生活的記錄就交給Nook Inc.吧', 1290);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (11, 'RIOT', 3, '英雄聯盟', '/oasis/product/resources/productImg/英雄聯盟千古不滅傳奇收藏阿璃造型組合包圖片.jpg', '英雄聯盟千古不滅傳奇收藏阿璃造型組合包', 'Riot Games 表示，Faker 不僅僅是《英雄聯盟》歷史上贏家中的贏家，他是這項競技的代名詞。他們將用量身打造的活動與風格裝飾在遊戲中紀念傳奇殿堂入選者，反映他們在峽谷所留下的成就，今年他們與 Faker 合作，為所有人提供一個記錄他職業生涯的活動通行證，並為鐵粉帶來了 3 種附帶全新效果、從獨特的參與擊殺次數顯示到防禦塔終結動畫的阿璃造型。', 9200);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (11, 'RIOT', 3, '英雄聯盟', '/oasis/product/resources/productImg/英雄聯盟不羈幻晶卡利斯造型圖片.jpg', '英雄聯盟不羈幻晶卡利斯造型', '大家好！我是造型團隊的產品負責人Stephanie Leung（ID：100 pc nuggets）。自從我們在賽季開始影片中公布新的尊爵不凡造型之後，已經過了一段時間了，所以今天我要來公布幾個接下來將登場的新尊爵不凡造型、神話商店輪替，以及新的神話結晶粉末造型主題！', 1487);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (11, 'RIOT', 3, '英雄聯盟', '/oasis/product/resources/productImg/英雄聯盟青花瓷拉克絲公仔產品圖片.jpg', '英雄聯盟青花瓷拉克絲公仔產品', 'RIOT 英雄聯盟 青花瓷 拉克絲公仔 官方限量，絕佳收藏！', 500);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (12, 'gamania', 12, '絕對武力', '/oasis/product/resources/productImg/絕對武力安娜人物模組圖片.jpg', '絕對武力安娜人物模組', '絕對武力安娜人物模組，為遊戲玩家精心設計的高品質角色模組，提升遊戲中的視覺享受與互動體驗，適合收藏與使用。', 520);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (12, 'gamania', 12, '絕對武力', '/oasis/product/resources/productImg/絕對武力安娜女僕造型圖片.jpg', '絕對武力安娜女僕造型', '絕對武力安娜女僕造型，這款精美的遊戲角色模組結合了戰鬥力與可愛女僕風格，為玩家帶來全新視覺享受與互動樂趣，提升遊戲體驗，讓你的戰鬥更加精彩。', 199);

INSERT INTO product (product_user_id, product_user_company_name, product_game_id, product_game_name, product_img, product_name, product_description, product_price)  
VALUES (12, 'gamania', 6, '楓之谷', '/oasis/product/resources/productImg/楓之谷專用卡2700點 (菈菈)圖片.jpg', '楓之谷專用卡2700點 (菈菈)點數卡', '購買2700點數儲值序號乙組(買家中心查看)，贈送菈菈數位收藏卡乙張(beanfun!內查看)', 2700);


-- purchase table ------------------------
CREATE TABLE purchase (
    purchase_id INT AUTO_INCREMENT NOT NULL,  
    purchase_user_id INT NOT NULL, 
    purchase_user_realName VARCHAR(255) NOT NULL,  
    purchase_user_cellphone VARCHAR(255) NOT NULL,  
    purchase_user_address VARCHAR(255) NOT NULL,
    purchase_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    purchase_total INT NOT NULL,
    CONSTRAINT purchase_primary_key PRIMARY KEY (purchase_id)
);

INSERT INTO purchase (purchase_user_id, purchase_user_realName, purchase_user_cellphone, purchase_user_address, purchase_total)  
VALUES (1, '賴柏安', '0963929616', '台北市文山區溪州街', 1249);

INSERT INTO purchase (purchase_user_id, purchase_user_realName, purchase_user_cellphone, purchase_user_address, purchase_total)  
VALUES (9, 'Peter Parker', '0987654321', '美國紐約市皇后區', 2539);

-- item table ------------------------
CREATE TABLE item (
    item_id INT AUTO_INCREMENT NOT NULL,
    item_purchase_id INT NOT NULL, 
    item_product_id INT NOT NULL,
    item_count INT NOT NULL,
    item_price INT NOT NULL, 
    item_total INT NOT NULL,
    CONSTRAINT item_primary_key PRIMARY KEY (item_id),
    FOREIGN KEY (item_purchase_id) REFERENCES purchase (purchase_id),
    FOREIGN KEY (item_product_id) REFERENCES product (product_id)
    
);

INSERT INTO item (item_purchase_id, item_product_id, item_count, item_price, item_total)  
VALUES (1, 1, 1, 1249, 1249);

INSERT INTO item (item_purchase_id, item_product_id, item_count, item_price, item_total)  
VALUES (2, 1, 1, 1249, 2539);

INSERT INTO item (item_purchase_id, item_product_id, item_count, item_price, item_total)  
VALUES (2, 4, 1, 1290, 2539);

-- spec table ------------------------
-- comment table ------------------------
-- description table ------------------------

USE oasis;
SELECT * FROM product;
SELECT * FROM purchase;
SELECT * FROM item;
