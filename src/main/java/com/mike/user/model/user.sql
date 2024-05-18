CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;
DROP TABLE IF EXISTS user;

set auto_increment_offset=1;
set auto_increment_increment=1; 

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


SELECT * FROM oasis.user;