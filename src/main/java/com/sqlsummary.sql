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
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   
VALUES(
	"【閒聊】聊聊這次v13.4貓戰角色的「強化」"
    ,"每當有改版消息釋出，玩家們總會熱烈討論，例如新增的超激角色能力是什麼? 又有哪些舊角色得到強化? 同時，什麼角色能稱作泛用，什麼角色可能注定是倉管，或是已成為時代眼淚，這些也會在我腦海裡浮現。

這篇主旨是從一個相對客觀的視角，討論玩家對角色強化的看法。
"
	,"2024-06-05 13:43:21"
    ,null -- reply
    ,2 -- favor
    ,1 -- view
    ,0 -- status
    ,11 -- userid
    ,5); -- gameid
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   
VALUES(
	"【心得】新手組隊思路Q&A"
    ,"前言
hi，大家好，這裡是Royal，今天來簡單做下新手組隊思路的Q&A
在文章開始之前，我建議新手去看一下煎餅好吃大大的這則影片和這篇文章，看完基本上就有概念聽得懂我在講什麼了
————
Q：貓戰有泛用隊嗎？
A：首先貓戰沒有所謂的泛用隊，因為每關的角色需求截然不同，就憑這點，新手就不可能一隊走天下，頂多就只能放點主力角色，加上幾個位置靈活調整，不然你可以像7神那般，一個對他無敗編成不利的關卡，試幾百遍甚至過千遍，來尋找那0.1%的通關可能，反正我是不推薦新手這樣去試啦，只會消耗自己的遊戲熱情而已

Q：貓戰組隊時會特別依賴聯組嗎？
A：答案是依賴程度有限，因為聯組更多的是為了改良隊伍，填充隊伍不足／加強隊伍優勢的地方，我得說一句，如果你那個聯組對隊伍加成不大的話，請不要放任何聯組，你這麼做只是浪費隊伍格子而已，這裡加成不大的例子就是，比如你只是為了拉麵放研究力聯組，但實際上研究力加成對象真的太少，你不如拔掉研究力聯組，去放一些更有用的貓咪，狂腿／康康之類的，幾隻有用的貓咪，不比你塞個研究力好多了？

Q：貓戰組隊的角色練等有什麼優先順序嗎？
A：我自己私心覺得，稀有度跟強度其實是不成正比的，我見過太多新手只練超激，忽視掉一些低稀有度的好用角色，實際上老手們也不難發現，你在前期基本上練1－2隻超激大型非近戰角色，已經足夠應付通關需求，相比起超激，前期好用的狂亂（如魚、牆、腿）、以及經常說的三幻神（拉麵、美模etc.)等，會是較低成本，且也能幫助你通關的好選擇，所以刷首抽的各位請不要忽視稀有／激稀有，他們前期可能比你的超激更好用

Q：貓戰組隊可以超激大遊行／組自己很喜歡的一隊嗎？
A：可以，等你能把角色練高等和角色齊全再說

Q：請問有沒有一些固定的組隊基本概念？
A：除了上述影片所說的以外，這就要看打法需求了，一般來說，只是正攻的話，就按平常關卡需求上陣角色即可，甚至在其中插入一些聯組改良也是可行的，速攻的話，一般都會綁定初始金額／初始貓炮規格等短期內效用最大的聯組，你要特化暫停妨害也是綁聯組等，這些就看你抄攻略的多寡了，基本上就是看多，懂得自然也會更多

Q：其他不懂的組隊思路問題？
A：歡迎在留言或回應指出，我會直接在文章裡解答
————
本篇完
"
	,"2024-06-07 12:40:31"
    ,null -- reply
    ,5 -- favor
    ,5 -- view
    ,0 -- status
    ,3 -- userid
    ,5); -- gameid
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   
VALUES(
	"每個月的2號跟22號，記得拿炸彈貓！(內有取得條件及方法)"
    ,"每個月的2號跟22號，
記得拿（免費）對黑最強控場「炸彈貓」!

取得時間:每月2號跟22號,
「下午14:22~14:24」,
只開放兩分鐘的快打關卡!
記得設個鬧鐘提醒自己一下唷

《取得條件》:
1.先取得花盆貓(因為炸彈是花盆的進階)
2.未來三需通關

我知道這是用火文,
但相信還是很多新朋友不會注意到,
所以發個文提醒一下~♥

至於關卡內容是無難度,
派個牛貓去甩一甩頭就過了；
入手炸彈貓後,很多對黑關都會簡單許多!!
"
	,"2024-06-21 12:40:31"
    ,null -- reply
    ,100 -- favor
    ,521 -- view
    ,0 -- status
    ,7 -- userid
    ,5); -- gameid
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   
VALUES(
	"【心得】新手福音---9000萬下載紀念 升級所需XP1/2活動!"
    ,"從昨天開始的9000萬下載紀念活動中除了和以往一樣的下載下載紀念活動外
還多了我玩了3、4年來第一次(沒記錯的話)出現的升級XP1/2活動!
這對拿到很多新貓的新手和想衝等排的很不錯啊!
不過對XP爆棚想消耗掉或是很多貓已經30+又沒有貓眼石的玩家沒幫助就是了~
"
	,"2024-06-11 09:54:31"
    ,null -- reply
    ,7 -- favor
    ,18 -- view
    ,0 -- status
    ,7 -- userid
    ,13); -- gameid
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   
VALUES(
	"【問題】請問克洛格果實的檢查方法（曠野之息）"
    ,"    雖然看著地圖一區區的拿了果實
城堡已確認全拿 但目前900還差2個
很不想再看著地圖一個個確認….眼睛好累
    請問有其他方法去尋找剩下的兩個嗎…
感謝
"
	,"2024-06-30 11:04:31"
    ,null -- reply
    ,73 -- favor
    ,200 -- view
    ,0 -- status
    ,6 -- userid
    ,9); -- gameid
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   
VALUES(
	"【問題】薩科的分身是否可以代替本體到經驗區吸經驗？"
    ,"對線有時候站那麼遠
    不怕被趕出經驗區 吸不到經驗嗎？
    明明血線掉超快，卻可以反殺？"
	,"2024-07-21 11:04:31"
    ,null -- reply
    ,7 -- favor
    ,200 -- view
    ,0 -- status
    ,2 -- userid
    ,10); -- gameid
INSERT INTO art (art_title,art_content,art_timestamp,art_reply,art_favor,art_view,art_status ,art_user_id,art_game_id)   
VALUES(
	"【情報】14.13，法洛士部分技能調整跟其他細項"
    ,"法洛士
基礎攻擊:60 削弱至 57
被動擊殺單位不再提供攻擊速度，現在擊殺敵方單位提供攻擊和法強
擊殺敵方單位提供:3-20攻擊力 和6-30 法術強度 [基於英雄等級]
參與擊殺英雄提供:15-30攻擊力和 25-50法術強度 [基於英雄等級]
效果持續時間和先前一樣[5/7/9/11秒 於 1/6/11/16級提升]



W被動額外傷害:7/13/19/25/31 加強至 7/14/21/28/35
W觸發每層效果所返還的基礎技能冷卻時間:12%加強至 15% [3層36% -> 45%]
W+Q額外已損失生命值傷害:6/8/10/12/14% 削弱至 6/7/8/9/10%,
W+Q額外已損失生命值傷害現在會隨W技能等級增加而不是英雄等級 [1/4/7/10/13級]


符文
電刑:
冷卻時間:25-20秒 加強至 全等級20秒
基礎傷害:30-220 → 50-190


靈魂收割
基傷:20-80 削弱至 全等級20
每收集一個靈魂增加的傷害:5 加強至 8
冷卻時間:45秒 加強至 30秒



其他:
1.新pve模式預計14.14版本上線(7/19號)
2.石頭人模組更新(2025年)
3.新英雄Ambessa是戰士。但是操作難度屬於高，不知道有沒有跟亞菲利歐一樣難。
4.Ray Yonggi(就是個設計師):已針對斯溫進行改動，改動程度約莫於庫奇跟雷柯薩那樣的規模。同時納菲芮、希格斯、卡桑蒂目前都在觀察名單中。觀察而已沒說要馬上動"
	,"2024-07-21 11:04:31"
    ,null -- reply
    ,7 -- favor
    ,200 -- view
    ,0 -- status
    ,7 -- userid
    ,3); -- gameid



-- favor table -----------------------
CREATE TABLE favor (
	favor_id INT AUTO_INCREMENT NOT NULL,
    favor_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    favor_status INT,
    favor_art_id INT,
    favor_user_id INT,
    -- CONSTRAINT  favor_art_id FOREIGN KEY (favor_art_id) REFERENCES art (art_id),
    -- CONSTRAINT  favor_user_id FOREIGN KEY (favor_user_id) REFERENCES user (user_id),
	CONSTRAINT favor_primary_key PRIMARY KEY (favor_id)
)AUTO_INCREMENT = 1;


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
values(3,'2024-06-21 08:30:00',2,'阿爾比恩'), (2,'2024-07-01 21:30:00',5,'動物森友會');

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
    purchase_product_id  INT NOT NULL,
    purchase_user_id INT NOT NULL, 
    purchase_user_realName VARCHAR(255),  
    purchase_user_cellphone VARCHAR(255),  
    purchase_user_address VARCHAR(255),
    purchase_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    purchase_closed boolean NOT NULL DEFAULT false,
    CONSTRAINT purchase_primary_key PRIMARY KEY (purchase_id)
);
INSERT INTO purchase (purchase_product_id, purchase_user_id, purchase_user_realName, purchase_user_cellphone, purchase_user_address)  
VALUES (1, 1, '賴柏安', '0963929616', '台北市文山區溪州街');
INSERT INTO purchase (purchase_product_id, purchase_user_id, purchase_user_realName, purchase_user_cellphone, purchase_user_address, purchase_closed)  
VALUES (1, 9, 'Peter Parker', '0987654321', '美國紐約市皇后區', true);
INSERT INTO purchase (purchase_product_id, purchase_user_id, purchase_user_realName, purchase_user_cellphone, purchase_user_address, purchase_closed)  
VALUES (2, 9, 'Peter Parker', '0987654321', '美國紐約市皇后區', true);