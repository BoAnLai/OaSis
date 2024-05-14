DROP TABLE IF EXISTS waiting;

CREATE TABLE waiting (
waiting_id int AUTO_INCREMENT PRIMARY KEY,
waiting_user_id int,
waiting_reserve timestamp,
waiting_maxpeople int,
waiting_game_name varchar(20),
constraint FOREIGN KEY(waiting_user_id) REFERENCES user_id(user_id)
);


INSERT INTO waiting(
waiting_user_id,waiting_reserve,waiting_maxpeople,waiting_game_name
)values(
2,'2024-05-30 21:00',5,"世紀帝國"
);


SELECT * FROM waiting;