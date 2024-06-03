CREATE DATABASE IF NOT EXISTS oasis;

use oasis;

DROP TABLE IF EXISTS art;



-- 以下設定: 自增主鍵的起點值，也就是初始值，取值範圍是1 .. 655355 --
set auto_increment_offset=1;
-- 以下設定: 自增主鍵每次遞增的量，其預設值是1，取值範圍是1 .. 65535 --
set auto_increment_increment=1; 
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
) AUTO_INCREMENT = 1;

INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)  VALUES ("生命的超越者 - 杰倫達爾默","大家好，我是來自","2022-05-13 11:15:55",NULL,1,1,1,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES ("【提醒】5/1開始的手環活動獎勵要記得每天領 - 杰倫達爾默","雖然介面起來就跟普通的每日簽到差不多
但這次的活動說明有特別提到","2022-05-13 11:15:55",1,3,10,2,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES ("【情報】【美好祝福福袋】維護完畢公告","親愛的冒險者們：
感謝冒險者們持續的支持，此段時間若有造成不便，敬請見諒~","2022-05-12 12:16:55",NULL,2,6,3,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES ("改版後的濃姬 打起來回饋","聽說改版有說變得比較簡單","2024-05-19 10:23:19",NULL,14,30,4,1);
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES("改版後的濃姬 打起來回饋","那五隻對應的是五個職業","2024-05-19 11:25:47",4,2,31,5,1)


