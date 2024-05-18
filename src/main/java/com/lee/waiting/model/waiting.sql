USE oasis;

DROP TABLE IF EXISTS waiting;
DROP TABLE IF EXISTS WaitingPerson;

CREATE TABLE waiting (
waiting_id int AUTO_INCREMENT PRIMARY KEY,
waiting_user_id int,
waiting_reserve timestamp,
waiting_maxpeople int,
waiting_game_name varchar(20) NOT NULL
);


CREATE TABLE WaitingPerson(
waitingPerson_id int AUTO_INCREMENT PRIMARY KEY,
waitingPerson_WaitingID int NOT NULL,
waitingPerson_UserID int NOT NULL
);


DESC waitingPerson;
SELECT * FROM waiting;
SELECT * FROM waitingPerson;