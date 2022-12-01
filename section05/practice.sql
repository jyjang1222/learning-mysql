-- 도전과제1 테스트
-- 1
SELECT database();
SHOW TABLES;
DESC cats;
SELECT cat_id FROM cats;
SELECT * FROM cats;
-- 2
SELECT name, breed FROM cats;
-- 3
SELECT name, age FROM cats WHERE name = 'Ringo' OR name = 'Misty';
-- 4
SELECT cat_id, age FROM cats WHERE cat_id = age;

-- 도전과제2 테스트
-- 1
UPDATE cats SET name = 'Jack'
WHERE name = 'Jackson';
-- 2
UPDATE cats SET breed = 'British Shorthair'
WHERE name = 'Ringo';
-- 3
UPDATE cats SET age = '12'
WHERE breed = 'Maine Coon';

-- 도전과제3 테스트
-- 1
SELECT * FROM cats;
SELECT * FROM cats WHERE age = 4;
DELETE FROM cats WHERE age = 4;
-- 2
SELECT * FROM cats WHERE cat_id = age;
DELETE FROM cats WHERE cat_id = age;
-- 3
DELETE FROM cats;