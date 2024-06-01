CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;
DROP TABLE IF EXISTS message;

set auto_increment_offset=1;
set auto_increment_increment=1; 

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
SELECT * FROM message;