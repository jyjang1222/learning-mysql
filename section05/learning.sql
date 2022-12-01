SHOW DATABASES;
USE cat_app;
SELECT database();

SHOW TABLES;
DROP TABLE cats;

CREATE TABLE cats (
	cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(100),
    breed VARCHAR(100),
    age INT
);
DESC cats;
SHOW COLUMNS FROM cats;

INSERT INTO cats (name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
SELECT * FROM cats;
-- 특정 열의 데이터만을 얻고 싶은 경우
SELECT name FROM cats;
SELECT name, age, cat_id From cats;
-- 특정 조건을 만족하는 데이터를 얻고 싶은 경우
-- 대소문자를 구분하지 않고 데이터를 가져온다
SELECT * FROM cats WHERE name = 'EGG';

-- AS 키워드를 사용하여 열의 이름 변경해서 표시하기
SELECT cat_id AS id, name FROM cats;
SELECT name AS cat_name FROM cats;
SELECT name AS cat_name, breed AS kitty_breed FROM cats;

-- UPDATE
UPDATE cats SET breed = 'Shorthair'
WHERE breed = 'Tabby';

UPDATE cats SET age = 14
WHERE name = 'Misty';

SELECT * FROM cats;
SELECT * FROM cats WHERE name = 'Misty';

-- DELETE
SELECT * FROM cats WHERE name = 'egg';
DELETE FROM cats WHERE name = 'egg';