CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;
DROP TABLE IF EXISTS label;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS user;

set auto_increment_offset=1;
set auto_increment_increment=1; 

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


-- user table ---------------------
CREATE TABLE user (
	user_id INT AUTO_INCREMENT NOT NULL,
    user_email VARCHAR(255) UNIQUE NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    user_identity ENUM('REGULAR', 'COMPANY', 'ADMINISTRATOR') NOT NULL,
    user_company_name VARCHAR(50) ,
    user_register_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_last_ip VARCHAR(39) NOT NULL,
    user_nickname VARCHAR(20),
    user_avatar TINYTEXT,
    user_intro TINYTEXT,
    
    CONSTRAINT user_primary_key PRIMARY KEY (user_id)
);

INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('mlaitw@gmail.com','1234','ADMINISTRATOR', null, '127.0.0.1', 'Mike', '/oasis/user/resources/avatarUploaded/1.jpg', 'Hi, I play video game since 12. I love Slay the Spire from Mega Crit and Hollow Knight from Team Cherry!');
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
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('spiderman@gmail.com','2222','REGULAR', null, '127.0.0.1', '蜘蛛人', null, null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('batman@gmail.com','2222','REGULAR', null, '127.0.0.1', '蝙蝠俠', null, null);

INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('clietSupport@riot.com','3333','COMPANY', 'RIOT', '127.0.0.1', '拳頭', '/oasis/user/resources/avatarUploaded/11.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('beanfun@gmail.com','4444','COMPANY', 'gamania', '127.0.0.1', 'klei', '/oasis/user/resources/avatarUploaded/12.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('teamcherry@gmail.com','5555','COMPANY', 'Team Cherry','127.0.0.1', 'cherry', '/oasis/user/resources/avatarUploaded/13.jpg', 'a game studio from Australia, about to release Hollow Knight: Silksong, a sequel to Hollow Knight');
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('thebattlecat@ponos.com','5555','COMPANY', 'PONOS','127.0.0.1', '貓咪大戰爭', '/oasis/user/resources/avatarUploaded/14.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('service@nintendo.com','5555','COMPANY', 'Nintendo','127.0.0.1', '任天堂', '/oasis/user/resources/avatarUploaded/15.jpg', null);
INSERT INTO user (user_email, user_password, user_identity, user_company_name, user_last_ip, user_nickname, user_avatar, user_intro)  
	VALUES ('service@blizzard.com','5555','COMPANY', 'Blizzard','127.0.0.1', '暴雪', '/oasis/user/resources/avatarUploaded/16.jpg', 'video game developer and publisher, well known for his product: World of Warcraft, Starcraft, Diablo, Overwatch and more');

SELECT * FROM genre;
select * from game;
SELECT game.game_name, genre.genre_name
FROM game
JOIN label ON game.game_id = label_game_id
JOIN genre ON genre.genre_id = label_genre_id
ORDER BY game_id;