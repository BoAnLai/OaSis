CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;


DROP TABLE IF EXISTS item; -- fk to purchase, product
DROP TABLE IF EXISTS purchase; -- fk to user
DROP TABLE IF EXISTS product; -- fk to user, game

DROP TABLE IF EXISTS subs; -- fk to user, game and art

DROP TABLE IF EXISTS WaitingPerson; -- fk to waiting
DROP TABLE IF EXISTS waiting;

DROP TABLE IF EXISTS report; -- fk to user and art
DROP TABLE IF EXISTS message; -- fk to user and art
DROP TABLE IF EXISTS favor; -- fk to user and art, both not apply yet
DROP TABLE IF EXISTS art; -- fk to user and game

DROP TABLE IF EXISTS label; -- fk to game and genre
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS user;


set auto_increment_offset=1;
set auto_increment_increment=1; 



-- user table ---------------------------
CREATE TABLE user (
	user_id INT AUTO_INCREMENT NOT NULL,
    user_email VARCHAR(255) UNIQUE NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    user_identity ENUM('REGULAR', 'COMPANY', 'ADMINISTRATOR') NOT NULL,
    user_company_name VARCHAR(50) ,
    user_register_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_last_ip VARCHAR(45) NOT NULL,
    user_nickname VARCHAR(20),
    user_avatar TINYTEXT,
    user_intro TINYTEXT,
    user_real_name VARCHAR(255),
    user_cellphone VARCHAR(20),
    user_address VARCHAR(255),
    
    CONSTRAINT user_primary_key PRIMARY KEY (user_id)
);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro, user_real_name, user_cellphone, user_address)  
	VALUES ('mlaitw@gmail.com','1234','ADMINISTRATOR', null, '127.0.0.1', 'Mike', '/oasis/user/resources/avatarUploaded/1.jpg', 'Hi, I play video game since 12. I love Slay the Spire from Mega Crit and Hollow Knight from Team Cherry!', '賴柏安', '0963929616', '台北市文山區溪洲街');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('qaswedfr0308@gmail.com','123','ADMINISTRATOR', null, '127.0.0.1', 'qaswedfr0308', '/oasis/user/resources/avatarUploaded/2.jpg', 'admin no.2');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('c22700101@gmail.com','810726','ADMINISTRATOR', null, '127.0.0.1', 'c22700101', '/oasis/user/resources/avatarUploaded/3.jpg', 'admin no.3');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('jasonlee40203006@gmail.com','40203006lee','ADMINISTRATOR', null, '127.0.0.1', 'jasonlee40203006', '/oasis/user/resources/avatarUploaded/4.jpg', 'admin no.4');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('j29387465@gmail.com','123456','ADMINISTRATOR', null, '127.0.0.1', 'j29387465', '/oasis/user/resources/avatarUploaded/5.jpg', 'admin no.5');

INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('superman@yahoo.com.tw','1111','REGULAR', null, '127.0.0.1', '超人', '/oasis/user/resources/avatarUploaded/6.jpg',null);    
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('stranger@gmail.com','2222','REGULAR', null, '127.0.0.1', '路人', '/oasis/user/resources/avatarUploaded/7.jpg', 'main character in "Mob Psyco 100" a Japanese manga');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('ironman@gmail.com','2222','REGULAR', null, '127.0.0.1', null, '/oasis/user/resources/avatarUploaded/8.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro, user_real_name, user_cellphone, user_address)  
	VALUES ('spiderman@gmail.com','2222','REGULAR', null, '::1', '蜘蛛人', null, null, 'Peter Parker', '0987654321', '美國紐約市皇后區');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('batman@gmail.com','2222','REGULAR', null, '127.0.0.1', '蝙蝠俠', null, null);

INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('clietSupport@riot.com','3333','COMPANY', 'RIOT', '127.0.0.1', '拳頭', '/oasis/user/resources/avatarUploaded/11.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('beanfun@gmail.com','4444','COMPANY', 'gamania', '127.0.0.1', 'klei', '/oasis/user/resources/avatarUploaded/12.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('teamcherry@gmail.com','5555','COMPANY', 'Team Cherry', '127.0.0.1', 'cherry', '/oasis/user/resources/avatarUploaded/13.jpg', 'a game studio from Australia, about to release Hollow Knight: Silksong, a sequel to Hollow Knight');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('thebattlecat@ponos.com','5555','COMPANY', 'PONOS', '127.0.0.1', '貓咪大戰爭', '/oasis/user/resources/avatarUploaded/14.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('service@nintendo.com','5555','COMPANY', 'Nintendo', '127.0.0.1', '任天堂', '/oasis/user/resources/avatarUploaded/15.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('service@blizzard.com','5555','COMPANY', 'Blizzard', '127.0.0.1', '暴雪', '/oasis/user/resources/avatarUploaded/16.jpg', 'video game developer and publisher, well known for his product: World of Warcraft, Starcraft, Diablo, Overwatch and more');


-- genre table ---------------------------
CREATE TABLE genre (
	genre_id INT AUTO_INCREMENT NOT NULL,
    genre_name VARCHAR(20) UNIQUE NOT NULL,
    genre_created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT genre_primary_key PRIMARY KEY (genre_id)
);
INSERT INTO genre (genre_name) VALUES ('即時戰略');
INSERT INTO genre (genre_name) VALUES ('MOBA');
INSERT INTO genre (genre_name) VALUES ('手機遊戲');
INSERT INTO genre (genre_name) VALUES ('塔防');
INSERT INTO genre (genre_name) VALUES ('橫向卷軸');
INSERT INTO genre (genre_name) VALUES ('大型多人線上角色扮演');
INSERT INTO genre (genre_name) VALUES ('動作角色扮演');
INSERT INTO genre (genre_name) VALUES ('社交');
INSERT INTO genre (genre_name) VALUES ('Nintendo Switch');
INSERT INTO genre (genre_name) VALUES ('第一人稱射擊');
INSERT INTO genre (genre_name) VALUES ('格鬥');

-- game table ------------------------
CREATE TABLE game (
	game_id INT AUTO_INCREMENT NOT NULL,
    game_name VARCHAR(20) UNIQUE NOT NULL,
    game_img TINYTEXT,
    game_created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT game_primary_key PRIMARY KEY (game_id)
);
INSERT INTO game (game_name,game_img) VALUES ('紅色警戒','/oasis/game/resources/gameImg/紅色警戒.jpg');
INSERT INTO game (game_name,game_img) VALUES ('星海爭霸','/oasis/game/resources/gameImg/星海爭霸.jpg');
INSERT INTO game (game_name,game_img) VALUES ('英雄聯盟','/oasis/game/resources/gameImg/英雄聯盟.jpg');
INSERT INTO game (game_name,game_img) VALUES ('傳說對決','/oasis/game/resources/gameImg/傳說對決.jpg');
INSERT INTO game (game_name,game_img) VALUES ('貓咪大戰爭','/oasis/game/resources/gameImg/貓咪大戰爭.png');
INSERT INTO game (game_name,game_img) VALUES ('楓之谷','/oasis/game/resources/gameImg/楓之谷.jpg');
INSERT INTO game (game_name,game_img) VALUES ('空洞騎士','/oasis/game/resources/gameImg/空洞騎士.jpg');
INSERT INTO game (game_name,game_img) VALUES ('艾爾登法環','/oasis/game/resources/gameImg/艾爾登法環.jpg');
INSERT INTO game (game_name,game_img) VALUES ('薩爾達傳說曠野之息','/oasis/game/resources/gameImg/薩爾達傳說曠野之息.jpg');
INSERT INTO game (game_name,game_img) VALUES ('動物森友會','/oasis/game/resources/gameImg/動物森友會.jpg');
INSERT INTO game (game_name,game_img) VALUES ('鬥陣特攻','/oasis/game/resources/gameImg/鬥陣特攻.jpg');
INSERT INTO game (game_name,game_img) VALUES ('絕對武力','/oasis/game/resources/gameImg/絕對武力.jpg');
INSERT INTO game (game_name,game_img) VALUES ('決勝時刻','/oasis/game/resources/gameImg/決勝時刻.jpg');
INSERT INTO game (game_name,game_img) VALUES ('阿爾比恩','/oasis/game/resources/gameImg/阿爾比恩.jpg');
INSERT INTO game (game_name,game_img) VALUES ('生死格鬥','/oasis/game/resources/gameImg/生死格鬥.jpg');

-- label table --------------------------
CREATE TABLE label (
	label_id INT AUTO_INCREMENT,
    label_genre_id INT NOT NULL,
    label_game_id INT NOT NULL,
    label_created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT label_primary_key PRIMARY KEY (label_id),
    FOREIGN KEY (label_genre_id) REFERENCES genre (genre_id),
    FOREIGN KEY (label_game_id) REFERENCES game (game_id)
);
INSERT INTO label (label_genre_id,label_game_id) VALUES (1,1);
INSERT INTO label (label_genre_id,label_game_id) VALUES (1,2);
INSERT INTO label (label_genre_id,label_game_id) VALUES (2,3);
INSERT INTO label (label_genre_id,label_game_id) VALUES (2,4);
INSERT INTO label (label_genre_id,label_game_id) VALUES (3,4);
INSERT INTO label (label_genre_id,label_game_id) VALUES (3,5);
INSERT INTO label (label_genre_id,label_game_id) VALUES (4,5);
INSERT INTO label (label_genre_id,label_game_id) VALUES (5,6);
INSERT INTO label (label_genre_id,label_game_id) VALUES (6,6);
INSERT INTO label (label_genre_id,label_game_id) VALUES (8,6);
INSERT INTO label (label_genre_id,label_game_id) VALUES (7,7);
INSERT INTO label (label_genre_id,label_game_id) VALUES (7,8);
INSERT INTO label (label_genre_id,label_game_id) VALUES (7,9);
INSERT INTO label (label_genre_id,label_game_id) VALUES (9,9);
INSERT INTO label (label_genre_id,label_game_id) VALUES (8,10);
INSERT INTO label (label_genre_id,label_game_id) VALUES (9,10);
INSERT INTO label (label_genre_id,label_game_id) VALUES (10,11);
INSERT INTO label (label_genre_id,label_game_id) VALUES (10,12);
INSERT INTO label (label_genre_id,label_game_id) VALUES (10,13);
INSERT INTO label (label_genre_id,label_game_id) VALUES (6,14);
INSERT INTO label (label_genre_id,label_game_id) VALUES (11,15);

-- art table --------------------------
CREATE TABLE ART (
	art_id	INT AUTO_INCREMENT NOT NULL,
	art_title VARCHAR(255),
	art_content MEDIUMTEXT,
	art_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
	art_reply INT,
	art_favor INT,
	art_view INT,
    art_user_id INT,
    art_game_id INT,
    CONSTRAINT  art_user_id FOREIGN KEY (art_user_id) REFERENCES user (user_id),
    CONSTRAINT  art_game_id FOREIGN KEY (art_game_id) REFERENCES game (game_id),
	CONSTRAINT art_primary_key PRIMARY KEY (art_id)
)AUTO_INCREMENT = 1;
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)  VALUES ("生命的超越者 - 杰倫達爾默","大家好，我是來自","2022-05-13 11:15:55",NULL,1,1,1,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES ("【提醒】5/1開始的手環活動獎勵要記得每天領 - 杰倫達爾默","雖然介面起來就跟普通的每日簽到差不多
但這次的活動說明有特別提到","2022-05-13 11:15:55",1,3,10,2,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES ("【情報】【美好祝福福袋】維護完畢公告","親愛的冒險者們：
感謝冒險者們持續的支持，此段時間若有造成不便，敬請見諒~","2022-05-12 12:16:55",NULL,2,6,3,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES ("改版後的濃姬 打起來回饋","聽說改版有說變得比較簡單","2024-05-19 10:23:19",NULL,14,30,4,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES("改版後的濃姬 打起來回饋","那五隻對應的是五個職業","2024-05-19 11:25:47",4,2,31,5,1);

-- favor table -----------------------
CREATE TABLE favor (
	favor_id INT AUTO_INCREMENT NOT NULL,
    favor_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    favor_art_id INT,
    favor_user_id INT,
    -- CONSTRAINT  favor_art_id FOREIGN KEY (favor_art_id) REFERENCES art (art_id),
    -- CONSTRAINT  favor_user_id FOREIGN KEY (favor_user_id) REFERENCES user (user_id),
	CONSTRAINT favor_primary_key PRIMARY KEY (favor_id)
)AUTO_INCREMENT = 1;
INSERT INTO favor (favor_timestamp, favor_art_id, favor_user_id)  
	VALUES ("2024-05-19 15:20:56",2,3);
 INSERT INTO favor (favor_timestamp, favor_art_id, favor_user_id)  
	VALUES ("2024-05-10 13:20:56",1,4);
INSERT INTO favor (favor_timestamp, favor_art_id, favor_user_id)  
	VALUES ("2024-03-19 12:20:56",3,2);
INSERT INTO favor (favor_timestamp, favor_art_id, favor_user_id)  
	VALUES ("2024-02-04 17:54:56",4,3);
INSERT INTO favor (favor_timestamp, favor_art_id, favor_user_id)  
	VALUES ("2023-01-19 17:11:56",3,2)  ;

-- message table ---------------------------------
CREATE TABLE message (
	message_id INT AUTO_INCREMENT NOT NULL,
    message_content mediumtext,
    message_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    message_art_id INT,
    message_user_id INT,
    CONSTRAINT  message_art_id FOREIGN KEY (message_art_id) REFERENCES art (art_id),
    CONSTRAINT  message_user_id FOREIGN KEY (message_user_id) REFERENCES user (user_id),
	CONSTRAINT message_primary_key PRIMARY KEY (message_id)
)AUTO_INCREMENT = 1;

INSERT INTO message (message_content,message_timestamp, message_art_id,message_user_id)  
	VALUES ("終於甭反射了，感動","2024-05-19 14:07:57 ",4,1);
INSERT INTO message (message_content,message_timestamp, message_art_id,message_user_id)  
	VALUES ("一階不能反射了","2024-05-19 17:17:37",4,5);
INSERT INTO message (message_content,message_timestamp, message_art_id,message_user_id)  
	VALUES ("看來有人沒有體驗過最一開始的濃姬才這樣說呢","2024-05-19 17:20:56 ",4,4);
INSERT INTO message (message_content,message_timestamp, message_art_id,message_user_id)  
	VALUES ("冰雷單打，第二關就是所有放置技能一頭腦的狂丟","2024-05-19 19:17:43",5,2);
INSERT INTO message (message_content,message_timestamp, message_art_id,message_user_id)  
	VALUES ("等起源改版拆段數後","2024-05-19 19:13:30",5,3);

-- report table ---------------------------------    
CREATE TABLE report (
	report_id INT AUTO_INCREMENT NOT NULL,
    report_issue VARCHAR(255),
    report_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    report_result BOOLEAN,
    report_reply VARCHAR(255),
    report_art_id INT,
    report_user_id INT,
    CONSTRAINT  report_art_id FOREIGN KEY (report_art_id) REFERENCES art (art_id),
    CONSTRAINT  report_user_id FOREIGN KEY (report_user_id) REFERENCES user (user_id),
	CONSTRAINT report_primary_key PRIMARY KEY (report_id)
)AUTO_INCREMENT = 1;

INSERT INTO report (report_issue,report_timestamp,report_result,report_reply, report_art_id,report_user_id)  
	VALUES ("不雅字眼","2024-05-21 14:07:57 ",TRUE,"檢舉已成功",4,1);
INSERT INTO report (report_issue,report_timestamp,report_result,report_reply, report_art_id,report_user_id)  
	VALUES ("辱罵","2024-05-21 14:07:58 ",FALSE,"檢舉已駁回",3,5);
INSERT INTO report (report_issue,report_timestamp,report_result,report_reply, report_art_id,report_user_id)  
	VALUES ("歧視","2024-05-22 14:03:57 ",TRUE,"檢舉已成功",2,3);

-- waiting table --------------------------
CREATE TABLE waiting (
waiting_id int AUTO_INCREMENT PRIMARY KEY,
waiting_user_id int,
waiting_reserve timestamp,
waiting_maxpeople int,
waiting_game_name varchar(20) NOT NULL
);
INSERT INTO waiting (waiting_user_id,waiting_reserve,waiting_maxpeople,waiting_game_name)
values(3,'2024-06-21 08:30:00',2,'阿爾比恩'), (2,'2024-07-01 21:30:00',5,'世紀帝國');

-- waiting_person table --------------------------
CREATE TABLE WaitingPerson(
waitingPerson_id int AUTO_INCREMENT PRIMARY KEY,
waitingPerson_WaitingID int NOT NULL,
waitingPerson_UserID int NOT NULL,
CONSTRAINT fk_waitingPerson_WaitingID FOREIGN KEY (waitingPerson_WaitingID) REFERENCES waiting(waiting_id)
);
INSERT INTO WaitingPerson(waitingPerson_WaitingID,waitingPerson_UserID)
values(1,3),(2,2);

-- subs table ----------------------
CREATE TABLE subs (
    subs_id INT AUTO_INCREMENT PRIMARY KEY not null,
    subs_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    subs_user_id INT NOT NULL,
    subs_game_id INT,
    subs_art_id INT,
    subs_status boolean,
    CONSTRAINT fk_user FOREIGN KEY (subs_user_id) REFERENCES user(user_id),
    CONSTRAINT fk_game FOREIGN KEY (subs_game_id) REFERENCES game(game_id),
    CONSTRAINT fk_art FOREIGN KEY (subs_art_id) REFERENCES art(art_id) 
);
INSERT INTO subs (subs_user_id, subs_game_id, subs_art_id, subs_status) VALUES
(1, 1, null, TRUE),
(2, null, 2, FALSE),
(1, 3, NULL, TRUE),
(3, NULL, 4, FALSE),
(2, null, 5, TRUE),
(4, 6, NULL, FALSE),
(3, 7, null, TRUE),
(5, NULL, 3, FALSE),
(2, 9, NULL, TRUE),
(4, 10, NULL, FALSE);


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
    purchase_user_realName VARCHAR(255),  
    purchase_user_cellphone VARCHAR(255),  
    purchase_user_address VARCHAR(255),
    purchase_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    purchase_total INT NOT NULL,
    purchase_closed boolean NOT NULL DEFAULT false,
    CONSTRAINT purchase_primary_key PRIMARY KEY (purchase_id)
);
INSERT INTO purchase (purchase_user_id, purchase_user_realName, purchase_user_cellphone, purchase_user_address, purchase_total)  
VALUES (1, '賴柏安', '0963929616', '台北市文山區溪州街', 1249);
INSERT INTO purchase (purchase_user_id, purchase_user_realName, purchase_user_cellphone, purchase_user_address, purchase_total, purchase_closed)  
VALUES (9, 'Peter Parker', '0987654321', '美國紐約市皇后區', 2539, true);
INSERT INTO purchase (purchase_user_id, purchase_total, purchase_closed)  
VALUES (8, 1290, false);

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
VALUES (2, 1, 1, 1249, 1249);
INSERT INTO item (item_purchase_id, item_product_id, item_count, item_price, item_total)  
VALUES (2, 4, 1, 1290, 1290);
INSERT INTO item (item_purchase_id, item_product_id, item_count, item_price, item_total)  
VALUES (3, 4, 1, 1290, 1290);