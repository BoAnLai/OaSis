CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;
DROP TABLE IF EXISTS report;

set auto_increment_offset=1;
set auto_increment_increment=1; 

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

INSERT INTO report (report_issue,message_timestamp,report_result,report_reply, report_art_id,report_user_id)  
	VALUES ("不雅字眼","2024-05-21 14:07:57 ",TRUE,"檢舉已成功",4,1);
INSERT INTO report (report_issue,message_timestamp,report_result,report_reply, report_art_id,report_user_id)  
	VALUES ("辱罵","2024-05-44 14:07:57 ",FALSE,"檢舉已駁回",3,5);
INSERT INTO report (report_issue,message_timestamp,report_result,report_reply, report_art_id,report_user_id)  
	VALUES ("歧視","2024-05-22 14:03:57 ",TRUE,"檢舉已成功",2,3);

SELECT * FROM report;