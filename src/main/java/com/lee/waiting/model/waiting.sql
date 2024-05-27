USE oasis;

DROP TABLE IF EXISTS WaitingPerson;
DROP TABLE IF EXISTS waiting;


CREATE TABLE waiting (
waiting_id int AUTO_INCREMENT PRIMARY KEY,
waiting_user_id int,
waiting_reserve timestamp,
waiting_maxpeople int,
waiting_game_name varchar(20) NOT NULL
);

INSERT INTO waiting (
waiting_user_id,waiting_reserve,waiting_maxpeople,waiting_game_name
)values(
3,'2024-06-21 08:30:00',2,'百變洽吉'),
(2,'2024-07-01 21:30:00',5,'世紀帝國')
;


CREATE TABLE WaitingPerson(
waitingPerson_id int AUTO_INCREMENT PRIMARY KEY,
waitingPerson_WaitingID int NOT NULL,
waitingPerson_UserID int NOT NULL,
CONSTRAINT fk_waitingPerson_WaitingID FOREIGN KEY (waitingPerson_WaitingID) REFERENCES waiting(waiting_id)
);

INSERT INTO WaitingPerson(
waitingPerson_WaitingID,waitingPerson_UserID
)values(
1,3),(2,2
);


