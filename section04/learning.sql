CREATE DATABASE cat_app;
SHOW DATABASES;
USE cat_app;
SHOW TABLES;
CREATE TABLE cats (
	name VARCHAR(50),
    age INT
);
DESC cats;
SHOW COLUMNS FROM cats;

-- 데이터 삽입
INSERT INTO cats(name, age)
VALUES('Blue', 1);
INSERT INTO cats(age, name) VALUES(11, 'Draco');
INSERT INTO cats
		(name, age)
VALUES  ('Peanut', 2),
	    ('Butter', 4),
        ('Jelly', 7);
        
-- 일부러 오류 발생 시키기
INSERT INTO cats(name, age) 
VALUES ('This cat is named 
        Charlie which is also a 
        human name.  In fact I know
        a couple of Charlies.  Fun Fact',
        10);
INSERT INTO cats(name, age) VALUES('Cuzco', 'aasdfwdfaefg');

-- 값의 일부만 넣어보기
INSERT INTO cats(name)
VALUES ('Alabama');
-- 값입력없이 키워드만 작성해보기
INSERT INTO cats()
VALUES ();

SELECT * FROM cats;

-- 빈값을 허용하지않는 테이블 생성
CREATE TABLE cats2 (
	name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

DESC cats2;
-- 빈값넣어보기
INSERT INTO cats2(name)
VALUES ('Texas');
INSERT INTO cats2(age)
VALUES (7);

SELECT * FROM cats2;

-- 기본값(디폴트값) 지정하기
CREATE TABLE cats3(
	name VARCHAR(100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);
INSERT INTO cats3(age)
VALUES (13);
INSERT INTO cats3()
VALUES ();

SHOW TABLES;
DESC cats3;
SELECT * FROM cats3;

INSERT INTO cats3(name) VALUES('Montana');
-- NULL값 수동적으로 넣기
INSERT INTO cats3(name, age) VALUES('Montana', NULL);

-- NOT NULL은 수동적으로 NULL값을 넣는것을 막아줌
CREATE TABLE cats4(
	name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);
INSERT INTO cats4(name, age) VALUES(NULL, NULL);
