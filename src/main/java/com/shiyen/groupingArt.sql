CREATE DATABASE IF NOT EXISTS oasis;

use oasis;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS favor;
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
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_user_id,art_game_id)   VALUES("改版後的濃姬 打起來回饋","那五隻對應的是五個職業","2024-05-19 11:25:47",4,2,31,5,1);

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
	VALUES ("辱罵","2024-05-10 14:07:57 ",FALSE,"檢舉已駁回",3,5);
INSERT INTO report (report_issue,report_timestamp,report_result,report_reply, report_art_id,report_user_id)  
	VALUES ("歧視","2024-05-22 14:03:57 ",TRUE,"檢舉已成功",2,3);

