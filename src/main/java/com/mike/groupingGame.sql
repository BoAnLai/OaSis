CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;
DROP TABLE IF EXISTS label;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS genre;

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

SELECT * FROM genre;
select * from game;
SELECT game.game_name, genre.genre_name
FROM game
JOIN label ON game.game_id = label_game_id
JOIN genre ON genre.genre_id = label_genre_id
ORDER BY game_id;