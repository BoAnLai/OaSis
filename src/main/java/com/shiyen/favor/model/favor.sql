CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;
DROP TABLE IF EXISTS favor;

set auto_increment_offset=1;
set auto_increment_increment=1; 

CREATE TABLE favor (
	favor_id INT AUTO_INCREMENT NOT NULL,
    favor_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    favor_art_id INT,
    favor_user_id INT,
    CONSTRAINT  favor_art_id FOREIGN KEY (favor_art_id) REFERENCES art (art_id),
    CONSTRAINT  favor_user_id FOREIGN KEY (favor_user_id) REFERENCES user (user_id),
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
SELECT * FROM favor;