-- 고용인 테이블 예제
CREATE DATABASE company;
USE company;
SELECT database();

CREATE TABLE employees (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed'
);
INSERT INTO employees (first_name, last_name, age)
VALUES ('Dora', 'Smith', 58);

DROP TABLE employees;
SHOW TABLES;
DESC employees;

