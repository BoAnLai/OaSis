CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;

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
    art_status INT,
    art_user_id INT,
    art_game_id INT,
    CONSTRAINT  art_user_id FOREIGN KEY (art_user_id) REFERENCES user (user_id),
    CONSTRAINT  art_game_id FOREIGN KEY (art_game_id) REFERENCES game (game_id),
	CONSTRAINT art_primary_key PRIMARY KEY (art_id)
)AUTO_INCREMENT = 1;
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)  VALUES ("【問題】大g賽恩思路問題","最近玩了20把左右
單雙彈性快打都有打
為什麼十分鐘破了首塔
隊友還是能崩線
對面打野都來抓我
我方打野那時候都不會去拿中立資源
也不會去幫其他路 就只顧著吃野
重點是整體經濟打開biltz 插件看 是領先的
但大概有2/3的局都輸掉
不太懂輸在哪裡
對局影片檔只能發YT 看嗎
還是有什麼方法可以給各位高手解惑嗎", "2024-06-05 22:42:20",NULL,1,2,0,1,3);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   VALUES ("【心得】這什麼白癡首頁","不是我要嘴
只要開著這個首頁，我的CPU可以多飆50%
整體衝上80~100%
只要開著個人資料什麼的就會降。

我就想說怎麼最近LOL掛著CPU就會急速運轉
原來是那個新首頁搞的

真的很爛。

上次那個戰魂鬥士吃爆記憶體。
這次吃爆CPU，都快懷疑首頁在挖礦了。","2024-06-04 11:42:04",Null,1,10,0,2,3);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   VALUES ("【心得】這什麼白癡首頁","客戶端平台真的需要整個打掉重寫

不然裡面肯定積累了10多年來的垃圾程式語法","2024-06-04 13:36:23",2,2,1,0,8,3);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   VALUES ("【心得】這什麼白癡首頁","我是舊電腦
昨天開始開遊戲然後會爆cpu重新開機
以為電腦真的太舊要換
原來是這破首頁
riot真的爛死","2024-06-04 13:41:30",2,14,1,0,10,3);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   VALUES("【心得】這什麼白癡首頁","改成陸配介面 沒煩惱 ..

直接規避掉實際  以前G社時期就是了  每次打開都一堆垃圾網頁

所以我已經養成習慣  直接改掉

","2024-06-04 13:43:21",2,2,1,0,11,3);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   VALUES("【討論】英雄聯盟官方的桌布程式","想問問各位 有沒有人使用官方的桌布程式只停留在薩蜜拉 靈戰的桌布後就沒再更新了 是我的電腦沒辦法再更新了還是就真的官方也沒再用這桌布繼續更新 新的桌布圖呢","2024-06-05 21:00:17",NULL,2,0,0,4,3);

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
    message_status INT,
    message_art_id INT,
    message_user_id INT,
    CONSTRAINT  message_art_id FOREIGN KEY (message_art_id) REFERENCES art (art_id),
    CONSTRAINT  message_user_id FOREIGN KEY (message_user_id) REFERENCES user (user_id),
	CONSTRAINT message_primary_key PRIMARY KEY (message_id)
)AUTO_INCREMENT = 1;

INSERT INTO message (message_content,message_timestamp,message_status, message_art_id,message_user_id)  
	VALUES ("建議發影片","2024-06-05 23:13:43 ",0,1,2);
INSERT INTO message (message_content,message_timestamp,message_status, message_art_id,message_user_id)  
	VALUES ("影片只能錄全部發上來嗎","2024-06-05 23:15:43",0,1,1);
INSERT INTO message (message_content,message_timestamp,message_status, message_art_id,message_user_id)  
	VALUES ("這回老子也深有同感，看到羊頭就來氣","2024-06-05 13:28:56 ",0,2,4);
INSERT INTO message (message_content,message_timestamp,message_status, message_art_id,message_user_id)  
	VALUES ("R粉快出來叫啊","2024-06-03 16:15:43",0,2,6);
INSERT INTO message (message_content,message_timestamp,message_status, message_art_id,message_user_id)  
	VALUES ("說不定現在內建挖礦程式，看有沒有哪位大神能拆包解惑","2024-06-04  17:40:30",0,2,8);
INSERT INTO message (message_content,message_timestamp,message_status, message_art_id,message_user_id)  
	VALUES ("以前CPU不用多好遊戲順順跑，不知道為啥現在這麼卡","2024-06-02  13:20:30",0,4,3);
INSERT INTO message (message_content,message_timestamp,message_status, message_art_id,message_user_id)  
	VALUES ("我現在可能要等這破活動結束才能玩lol 每次開遊戲都直接重新開機 救我
","2024-06-05  16:23:30",0,4,9);

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
values(3,'2024-06-21 08:30:00',2,'百變洽吉'), (2,'2024-07-01 21:30:00',5,'世紀帝國');

-- waiting_person table --------------------------
CREATE TABLE WaitingPerson(
waitingPerson_id int AUTO_INCREMENT PRIMARY KEY,
waitingPerson_WaitingID int NOT NULL,
waitingPerson_UserID int NOT NULL,
CONSTRAINT fk_waitingPerson_WaitingID FOREIGN KEY (waitingPerson_WaitingID) REFERENCES waiting(waiting_id)
);

INSERT INTO WaitingPerson(waitingPerson_WaitingID,waitingPerson_UserID)
values(1,3),(2,2);
