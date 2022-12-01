-- 옷장의 셔츠 데이터베이스 만들기 실습
-- 셔츠 db 생성
CREATE DATABASE shirts_db;
SHOW DATABASES;
USE shirts_db;
SELECT database();
-- 셔츠 테이블 생성
CREATE TABLE shirts (
	shirt_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(50) NOT NULL DEFAULT 'unknown_cloth',
    color VARCHAR(30) NOT NULL DEFAULT 'undefined_color',
    shirt_size VARCHAR(20) NOT NULL DEFAULT 'undefined_size',
    last_worn INT NOT NULL DEFAULT 999
);
DESC shirts;
-- 셔츠테이블에 다중 데이터 넣기
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES  ('t-shirt', 'white', 'S', 10),
		('t-shirt', 'green', 'S', 200),
		('polo shirt', 'black', 'M', 10),
		('tank top', 'blue', 'S', 50),
		('t-shirt', 'pink', 'S', 0),
		('polo shirt', 'red', 'M', 5),
		('tank top', 'white', 'S', 200),
		('tank top', 'blue', 'M', 15);
-- 단일 데이터 넣기
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

-- 특정 데이터 찾기
SELECT article, color FROM shirts;
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';
SELECT * FROM shirts;

-- 업데이트 하기
UPDATE shirts SET shirt_size = 'L'
WHERE article = 'polo shirt';
UPDATE shirts SET last_worn = 0
WHERE last_worn = 15;
UPDATE shirts SET shirt_size = 'XS', color = 'off white'
WHERE color = 'white' and (article = 'polo shirt' or article = 't-shirt');

-- 데이터 삭제하기
DELETE FROM shirts
WHERE last_worn >= 200;
DELETE FROM shirts
WHERE article = 'tank top';
DELETE FROM shirts;

DROP TABLE shirts_db;
