# 목차
1. [데이터베이스 개요](#1-데이터베이스-개요)
2. [데이터베이스와 테이블 만들기](#3-데이터베이스와-테이블-만들기)
3. [데이터 삽입하기](#4-데이터-삽입하기)
4. [CRUD 명령](#5-CRUD-명령)
5. [문자열 함수](#7-문자열,-숫자,-날짜-함수)
6. [선택사항 정교화하기](#8-선택사항-정교화하기)
7. [그룹함수](#9-그룹함수)
8. [서브쿼리](#10-서브쿼리)

# 단축키
- 1개의 SQL문 실행 : 커서가 있는 1개의 SQL문을 실행 <code>Ctrl+Enter</code>
- 여러개(다중) SQL문 실행 : 실행하고자 하는 SQL문들의 영역을 드래그한 후 <code>Ctrl+Shift+Enter</code>
- SQL창의 전체 모두 실행 : SQL창의 모든 SQL문을 실행 <code>Ctrl+Shift+Enter</code>

# 1. 데이터베이스 개요

## 데이터베이스란

- 데이터베이스란 컴퓨터로 접근이 가능한 데이터의 집합체를 의미한다.
- DBMS는 데이터베이스 관리 시스템을 의미하며 데이터를 추가하거나 삭제, 자료의 구조화 등 데이터의 효율적인 처리를 할 수 있도록 데이터베이스를 관리할수 있다.
- MySQL은 흔히 쓰이는 DBMS이다.

## MySQL vs SQL 차이

- SQL은 구조화된 쿼리언어를 의미하며 데이터베이스에게 말을 걸 때 사용하는 언어이다. SQL 명령문을 쿼리라고 부른다.
- MySQL은 SQL 언어를 사용하는 수많은 DBMS 중의 하나일 뿐이다.

## DBMS 들의 차이

- 구문에는 약간 차이가 있지만 SQL 작동법에는 표준이 있기 때문에 구문이 비슷하다. 그리하여 SQL을 학습하고 나면 SQL을 사용하는 다른 DBMS 로의 전환이 쉽다.

# 3. 데이터베이스와 테이블 만들기

## 이름 규칙

**1. 데이터베이스 이름**
  - MyApp 대문자를 이용하여 구분하는 방식
  - my_app 모두 소문자로 작성하고 \_로 구분하는 스네이크표기법
  - 둘중 아무것이나 사용해도 상관없으나 일관성이 있어야한다. - 강사는 스네이크표기법 추천

**2. 테이블 이름**
  - 테이블 이름에는 cats 같이 복수형을 사용하는 것이 좋다.

**3. SQL 명령문**
  - 소문자와 대문자 둘다 사용이 가능하지만 명령문과 데이터베이스 이름 또는 테이블 이름을 구분하기위해 대문자를 쓰는 방식이 좋다.

## 데이터베이스 명령문

### SHOW DATABASES;
- 사용 가능한 데이터베이스를 나열
### CREATE DATABASE database_name;
- 데이터베이스 생성을 위한 명령
### DROP DATABASE database_name;
- 데이터베이서 제거를 위한 명령
### USE database_name;
- 특정 데이터베이스 사용
### SELECT database();
- 현재 사용중인 데이터베이스 확인

## 관계형 데이터베이스

- 데이터베이스는 단지 수많은 테이블이며 그 곳에 데이터가 저장된다.
- 모든 데이터베이스가 테이블이 있는 것이 아니며 테이블은 관계형 데이터베이스에 존재한다.

## 데이터 테이블의 타입

- 테이블의 데이터 타입 종류는 매우 많지만 주로 쓰이는 타입은 정해져있다,
- 정수형에는 int
- 문자열에는 varchar(length)
  - char는 고정길이, varchar는 가변길이 이다.

## 테이블 명령문

### CREATE TABLE table_name (column_names)
- 테이블 생성

```sql
CREATE TABLE table_name (
        column_name data_type,
        column_name data_type,
    );

-- 예시
CREATE TABLE cats (
        name VARCHAR(100),
        age INT,
    );
```

### SHOW TABLES;
- 테이블들의 확인 (현재 사용중인 데이터베이스)
### SHOW COLUMNS FROM table_name;
- 테이블 내의 칼럼들 확인
### DESC table_name;
- 테이블 내의 칼럼들 확인 (바로위 명령문과 기능 동일)
### DROP TABLE table_name;
- 테이블 삭제

# 4. 데이터 삽입하기

## 데이터 명령문

### INSERT INTO table_name(column_name) VALUES (data);

```sql
-- 데이터 삽입
INSERT INTO table_name(column_name)
VALUES (data);

-- 삽입 예시
INSERT INTO cats(name, age)
VALUES ('Jetson', 7);

-- 여러개 삽입
INSERT INTO table_name
        (column_name, column_name)
VALUES  (value, value),
        (value, value),
        (value, value);

-- 여러개 삽입 예시
INSERT INTO cats
        (name, age)
VALUES  ('Charlie', 10),
        ('Sadie', 3),
        ('Lazy Bear', 1);
```

### SELECT \* FROM table_name;
  - 데이터 확인

## 테이블 Null열의 의미

| Field | Type        | Null | Key | Default |
| ----- | ----------- | ---- | --- | ------- |
| name  | varchar(50) | YES  |     | Null    |
| age   | int         | YES  |     | Null    |

- Null이 YES이면 빈값의 데이터를 넣는 것을 허용한다는 의미이다.
- 빈값의 데이터 넣기를 허용하지 않으려면 테이블을 정의할때 할수있다.

## NOT NULL & DEFAULT

### NOT NULL

```sql
CREATE TABLE table_name (
        column_name data_type NOT NULL,
        column_name data_type NOT NULL,
    )

-- 예시
CREATE TABLE cats (
        name VARCHAR(100) NOT NULL,
        age INT NOT NULL,
    )
```
- NULL을 허용하고 싶지 않을때 사용

### DEFAULT
```sql
CREATE TABLE table_name (
        column_name data_type DEFAULT default_value,
        column_name data_type DEFAULT default_value,
    )

-- 예시
CREATE TABLE cats (
        name VARCHAR(100) DEFAULT 'unnamed',
        age INT DEFAULT 99,
    )
```
- 빈값의 데이터가 들어왔을때 지정할 기본값

### NOT NULL 과 DEFAULT 키워드 둘다 사용하는 경우

```sql
-- DEFAULT를 지정했는데 왜 NOT NULL을 같이 사용하는지에 대한 예시
CREATE TABLE cats3(
	name VARCHAR(100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);

-- age를 입력하지 않아서 기본값인 99가 지정됨
INSERT INTO cats3(name) VALUES('Montana');
-- NULL값을 수동으로 넣으면 기본값이 지정되는 것이 아닌 NULL값이 들어간다
INSERT INTO cats3(name, age) VALUES('Montana', NULL);

-- NOT NULL DEFAULT 둘다 사용 예시
CREATE TABLE cats4(
	name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);
-- NOT NULL 키워드를 사용해서 NULL값을 수동으로 넣어도 들어가지 않는다
INSERT INTO cats4(name, age) VALUES(NULL, NULL);
```

## 테이블 기본키 지정하기

### PRIMARY KEY & AUTO_INCREMENT
- 기본키의 이름을 지정한 뒤에 **PRIMARY KEY (id_column_name)** 키워드를 사용

```sql
-- 방법1
CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
-- 방법2
CREATE TABLE unique_cats (
    cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
);


CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
);
```

- 데이터가 같을 때 기본키를 지정해주면 고유한 데이터를 만들 수 있다.
- **AUTO_INCREMENT** 키워드를 사용하면 키값이 1부터시작하고 값을 삽입하면 자동으로 1을 증가시켜주어 키값을 입력하는 수고를 덜수있다.

# 5. CRUD 명령

## CRUD란

1. Create
2. Read
3. Update
4. Delete

## Create

- 기존에 배운 CREATE키워드를 통해서 테이블 생성이 가능하다.

## Read

### SELECT 키워드
```sql
-- 모든열의 데이터를 가져오려면 * 를 입력하면 된다.
SELECT * FROM cats;
-- 특정 열의 데이터만을 얻고 싶은 경우
SELECT name FROM cats;
SELECT name, age, cat_id From cats;
```
- SELECT 키워드를 사용하여 특정열의 데이터 열람이 가능하다.

### WHERE 키워드
```sql
SELECT * FROM cats WHERE age = 4;
-- 대소문자를 구분하지 않고 데이터를 가져온다.
SELECT * FROM cats WHERE name='Egg';
SELECT * FROM cats WHERE name='EGG';
```
- 구체적인 데이터를 얻고자 한다면 WHERE 키워드를 사용한다.
  - 업데이트는 특정 데이터를 지정하는 방식으로 주로 쓰여지기 때문에 SELECT 보다는 WHERE 이 주로 쓰인다.
- WHERE 키워드를 통해 조건식 작성이 가능하다.

### AS 키워드
```sql
SELECT name AS cat_name FROM cats;
SELECT name AS dog_name FROM dogs;
```
- AS 키워드는 alias의 약어로 칼럼의 이름을 변경해서 표시하고자할때 쓰인다.
- 예) cats테이블의 name칼럼 dogs테이블의 name칼럼의 데이터를 가져왔는데 칼럼의 이름이 같아 혼동할 수 있기때문에 AS 키워드가 쓰인다.

### IS NULL, IS NOT NULL, IFNULL(data, value)
```sql
-- column_name가 null인 값만 조회하기
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
```
- IS NULL 키워드는 NULL 값(비어있는 값)을 찾을 때 쓰인다.
  
```sql
-- column_names가 null이 아닌 값만 조회하기
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
```
- IS NOT NULL 키워드는 NULL 값이 아닌 값(비어있지 않은 값)을 찾을 때 사용된다.

```sql
SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE') AS TLNO FROM PATIENT
WHERE GEND_CD='W' AND AGE <= 12
ORDER BY AGE DESC, PT_NAME ASC
```
- IFNULL(data, value) 함수는 NULL인 값을 0으로 출력하고 싶으면 사용한다.

## UPDATE

### UPDATE & SET 키워드
```sql
UPDATE cats SET breed = 'Shorthair'
WHERE breed = 'Tabby';
```
- UPDATE키워드로 업데이트할 테이블을 선택하고 수정사항은 SET키워드로 한다.

## DELETE
```sql
-- 특정 데이터 삭제
DELETE FROM cats WHERE name = 'Egg';
-- 테이블의 모든 데이터 삭제
DELETE FROM cats;
```

- 삭제를 해도 기본키는 바뀌지 않는다.
  - 예) 1234 중 3을 삭제하면 124가 남는다

## 기타

- 작성된 명령문은 쿼리(Query)라고 부른다.
- 쿼리는 데이터베이스 등에서 원하는 정보를 검색하기 위해 요청하는 것을 말한다

# 7. 문자열, 숫자, 날짜 함수

## 외부 sql파일 실행법

- source 키워드
  - CLI에서만 가능하고 source 오른쪽에 실행하고자 하는 sql파일 경로를 입력해주면된다.

## 문자열 함수의 종류

### CONCAT() & CONCAT_WS()

```sql
SELECT author_fname, author_lname FROM books;
SELECT CONCAT('Hello', ' ', 'World');
SELECT CONCAT(author_fname, ' ', author_lname) AS full_name
FROM books;
SELECT author_fname, CONCAT(author_fname, ' ', author_lname) AS full_name
FROM books;
SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full
FROM books;
SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full,
CONCAT(author_lname, ' ', author_fname) AS reverse_full
FROM books;
SELECT CONCAT_WS('-', title, author_fname, author_lname)
FROM books;
```

- CONCAT_WS(Concatenate With Separator)
  - 칼럼의 값들을 연결시켜 나타내고 싶을때 사용하는 함수이다.

### SUBSTR() == SUBSTRING()

```sql
SELECT SUBSTR('hello world', -3);
-- rld
SELECT SUBSTR("Where I'm Calling From: Selected Stories", 1, 10);
SELECT SUBSTR(title, 1, 10) AS short_title FROM books;
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM books;
```

- SUBSTR(str, idx, (len))
- mysql에서는 idx가 1부터 시작한다.
  - ... -3,-2,-1,1,2,3 ...
- len만큼 반환하며 len을 작성하지 않으면 문자열 끝까지 반환한다.
- mysql에서 SUBSTR() 은 SUBSTRING() 과 동의어이다.
  - 주로쓰는 언어에 맞춰서 둘중 하나를 사용하도록 하자..

### REPLACE()

```sql
SELECT REPLACE('hello world', 'hell', '@#$%');
-- @#$%o world
SELECT REPLACE('cheese bread coffe milk', ' ', ' and ');
SELECT SUBSTR(REPLACE(title, 'e', '3'), 1, 10) FROM books;
```

- REPLACE(str, 바꿀문자, 치환할문자)
- 대소문자를 구분한다.

### REVERSE()

```sql
SELECT REVERSE('hello world');
-- dlrow olleh
SELECT
    author_fname,
    REVERSE(author_fname) AS reverse_fname
FROM books;
```

### CHAR_LENGTH()

```sql
SELECT CHAR_LENGTH('hello world');
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT
	CONCAT(
    author_lname,
    ' is ',
    CHAR_LENGTH(author_lname),
    ' characters long') AS print_length
FROM books;
```

### UPPER() & LOWER()

```sql
SELECT UPPER('hello world');
-- HELLO WORLD
SELECT LOWER('HELLO WORLD');
-- hello world
```

### CONCAT()
- 문자열 이어붙이기
```sql
SELECT CONCAT('aaa', 'bbb', 'ccc'); -- aaabbbccc
```

### INSERT()
```sql
SELECT INSERT('abcde', 2, 3, 'bbb'); -- abbbe
- 2번째부터 3개를 삭제한 후, 삽입
```

### INSERT()
```sql
SELECT INSERT('aaaa', 2, 0, 'bbb');	-- abbbaaa
- 2번째부터 삽입
```

### REPLACE()
```sql
SELECT REPLACE('aabbcc', 'bb', 'ff');	-- aaffcc
- 'bb'를 'ff'로 변경
```

### INSTR()
```sql
SELECT INSTR('안녕하세요', '하세');	-- 3
- '하세'라는 문자열이 있으면 해당 문자열의 시작 위치(=인덱스)
```

### INSTR()
```sql
SELECT INSTR('안녕하세요', '방갑');	-- 0
- 해당 문자열이 없으면 0
```

### LEFT()
```sql
SELECT LEFT('abcdef', 3); -- abc
```
- 왼쪽에서부터 3개를 제외한 나머지 삭제

### RIGHT()
```sql
SELECT RIGHT('abcdef', 3); -- def
```
- 오른쪽에서부터 3개를 제외한 나머지 삭제

### MID()
```sql
SELECT MID('abcdefg', 2, 3) -- bcd
```
- 2번째에서부터 3개를 제외한 나머지 삭제

### LTRIM, RTRIM, TRIM
```sql
SELECT CONCAT('[', '         abc        ', ']'); -- 공백제거 없이 연결
SELECT CONCAT('[', LTRIM('         abc        '), ']');	-- LTRIM() : 왼쪽 공백 제거 후 연결
SELECT CONCAT('[', RTRIM('         abc        '), ']');	-- RTRIM() : 오른쪽 공백 제거 후 연결
SELECT CONCAT('[', TRIM('         abc        '), ']');	-- TRIM()  : 좌우 공백 제거 후 연결
```

### LCASE, LOWER
```sql
SELECT LCASE('acDDefg'); -- 소문자 변환
SELECT LOWER('acDDefg'); -- 소문자 변환
```

### UCASE, UPPER
```sql
SELECT UCASE('acDDefg'); -- 대문자 변환
SELECT UPPER('acDDefg'); -- 대문자 변환
```

### REVERSE
```sql
SELECT REVERSE('acDDefg'); -- 반전
```

## 숫자 함수

### ABS()		
- 절대값
### CEIL()	
- 소수점 올림
### FLOOR()	
- 소수점 버림
### ROUND()	
- 소수점 반올림(자리수 지정 가능)
### TRUNCATE()
- 소수점 버림(자리수 지정 가능)
### POW()		
- x의 y승
### MOD()		
- 나머지
### GREATEST()
- max
### LEAST()	
- min

```sql
SELECT ABS(100), ABS(-100);

SELECT ROUND(3.5), ROUND(3.1);
SELECT CEIL(3.5), CEIL(3.1);
SELECT FLOOR(3.5), FLOOR(3.1);

SELECT ROUND(3.14356, 0), ROUND(3.51234, 0); -- 소수점 이하 0자리
SELECT ROUND(3.14356, 1), ROUND(3.55234, 1); -- 소수점 이하 1자리
SELECT ROUND(13.14356, -1), ROUND(15.55234, -1); -- 1의 자리

SELECT TRUNCATE(3.14356, 0), TRUNCATE(3.51234, 0); -- 소수점 이하 0자리
SELECT TRUNCATE(3.14356, 1), TRUNCATE(3.55234, 1); -- 소수점 이하 1자리
SELECT TRUNCATE(13.14356, -1), TRUNCATE(15.55234, -1); -- 1의 자리

SELECT POW(10, 3);
SELECT MOD(10, 3);
SELECT GREATEST(10, 3, 4, 5, 3, 6);
SELECT LEAST(10, 3, 4, 5, -3, 6);
```

## 날짜 함수

### 날짜와 시간
```sql
SELECT NOW();
SELECT SYSDATE();
SELECT CURRENT_TIMESTAMP();
```

### 날짜
```sql
SELECT CURRENT_DATE();
SELECT CURDATE();
```

### 시간
```sql
SELECT CURRENT_TIME();
SELECT CURTIME();

SELECT NOW(), YEAR(NOW());
SELECT NOW(), MONTH(NOW());
SELECT NOW(), DAY(NOW());
SELECT(CONCAT(YEAR(NOW()), '년 ', MONTH(NOW()), '월 ', DAY(NOW()), '일'));

SELECT NOW(), MONTHNAME(NOW());
SELECT DAYNAME(NOW());

SELECT NOW(), DAYOFWEEK(NOW());		# 일요일 = 1
SELECT NOW(), DAYOFYEAR(NOW());		# 올해의 몇번째 날
SELECT NOW(), WEEK(NOW());			# 올해의 몇번째 주
```

### 포맷
```sql
SELECT NOW(), DATE_FORMAT(NOW(), '%Y년 %m월 %d일, %H시 %i분 %S초');
```

# 8. 선택사항 정교화하기

## DISTINCT 키워드

```sql
SELECT DISTINCT author_fname FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;
```

- 중복되는 데이터들을 제외시켜서 하나만 표시해준다.
- 칼럼이 여러개면 and 처럼 동시에 중복이여야 제외시켜준다.
- SELECT 키워드와 칼럼명 앞에 작성하는 것에 유의한다.

## ORDER BY 키워드

```sql
-- 오름차순 (ascend)
SELECT title FROM books ORDER BY title;
SELECT released_year FROM books ORDER BY released_year ASC;
-- 내림차순 (descend)
SELECT author_lname FROM books ORDER BY author_lname DESC;

SELECT title, released_year, pages FROM books ORDER BY pages;
SELECT title FROM books ORDER BY released_year;
-- author_lname의 idx가 2이다.
SELECT title, author_fname, author_lname
FROM books ORDER BY 2;
-- author_lname을 우선 정렬후에 author_fname을 정렬한다.
SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname;

-- 1학년 학생의 이름, 학년, 키, 몸무게 데이터를 검색하라(단, 키 내림차순으로 정렬하고, 같은 키는 몸무게 오름차순으로 정렬)
SELECT STUDENT_NAME, STUDENT_GRADE, STUDENT_HEIGHT, STUDENT_WEIGHT FROM student
WHERE STUDENT_GRADE = 1 ORDER BY STUDENT_HEIGHT DESC, STUDENT_WEIGHT DESC;
```

- 기본적으로 오름차순으로 정렬돼서 ASC는 생략이 가능하다. (숫자, 문자 순)
- 오름차순: ASC, 내림차순: DESC
- 조회대상이 아니어도 ORDER BY 를 통해 기준을 정할수 있다.
- ORDER BY 2; 에서 2는 idx를 의미한다.
  - title: 1, author_fname: 2, author_lname: 3
- ORDER BY 기준을 추가로 작성해줄수 있는데, 왼쪽부터 차례대로 우선 정렬한다.
- 정렬을 할때 매우 유용한 키워드이다. - 비싼순으로 정렬한다든지 추천수대로 정렬한다든지

## LIMIT 키워드

```sql
SELECT title FROM books LIMIT 3;
SELECT * FROM books LIMIT 1;
-- LIMIT len
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;
-- LIMIT idx, len
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0, 5;

SELECT * FROM tbl LIMIT 95, 18446744073709551615;
```

- LIMIT idx, len
- idx가 0 부터 시작한다. (idx까지 쓰이는 경우는 잘 없다)
- 게시판에 게시글수를 제한한다든지에 쓰인다.
- 특정 행에서 행끝까지 조회하려면 두번째 인자에 큰 숫자를 사용한다.

## LIKE 키워드

```sql
-- ~da~
SELECT title FROM books
WHERE author_fname LIKE '%da%';
-- da~
SELECT title, author_fname FROM books
WHERE author_fname LIKE 'da%';
-- 책이름이 정확히 'the'만 찾는다.
SELECT title, author_fname FROM books
WHERE title LIKE 'the';
-- _가 3개이므로 길이가 3인 데이터가 모두 표시된다
SELECT title, stock_quantity FROM books
WHERE stock_quantity LIKE '___';
-- 모든데이터출력
SELECT title, stock_quantity FROM books
WHERE stock_quantity LIKE '%';

SELECT phone_number FROM numbers
WHERE phone_number LIKE '___-____-____'
-- 데이터에 %나_가 있는 경우 조회하기
SELECT title FROM books
WHERE title LIKE '%\%%';
SELECT title FROM books
WHERE title LIKE '%\_%';
```

- '%da%' 에서 %는 ~를 의미한다.
  - da앞뒤로 무언가가 있어야 한다는 의미는 아니다.
- ''로 감싸줘야 하는것을 주의해야한다.
- WHERE과 같이 써야하는것에 주의한다. (ORDER BY x)
- \_는 길이를 의미한다. len만큼 \_추가
- %나 \_를 조회하려면 이스케이프문자를 활용한다.

# 9. 그룹함수
## 그룹함수의 종류
### COUNT()
```sql
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;
SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
```
- 갯수를 출력

### SUM()
```sql
-- [문제] book테이블에서 전체 도서 가격의 총합 가져오기
SELECT SUM(book_price) FROM book;

-- [문제] book테이블에서 도서 가격을 10%로 인상했을 때의 총합 가져오기
SELECT SUM(book_price), SUM(book_price*1.1) FROM book;
```

### AVG()
```sql
-- [문제] book테이블에서 전체 도서 가격의 평균 가져오기
-- [조건] 소수점 이하 2자리까지 출력
SELECT AVG(book_price) FROM book;
SELECT ROUND(AVG(book_price), 2) FROM book;
```

### MAX()
```sql
-- [문제] book테이블에서 도서 가격이 가장 높은 도서가격 가져오기
SELECT MAX(book_price) FROM book;
```

### MIN()
```sql
-- [문제] book테이블에서 도서 가격이 가장 낮은 도서가격 가져오기
SELECT MIN(book_price) FROM book;
```

## GROUP BY를 이용해 그룹화하기
### GROUP BY
```sql
SELECT author_lname, COUNT(*) FROM books
GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*) FROM books
GROUP BY author_fname, author_lname;

SELECT CONCAT(released_year, ' ', COUNT(*), ' books released') FROM books
GROUP BY released_year;
```
- 그룹 함수와 함께 사용한다.
- GROYP BY 될 때에 내부적으로 임시 테이블을 만든다.
- 이때 임시 테이블의 컬럼은 GROUP BY에 작성한 컬럼과
- SELECT에서 사용한 그룹함수가 된다.

### HAVING
```sql
-- cart테이블에서 회원이 구입한 도서의 수량이 2개 이상인 회원의 id 가져오기
DESC cart;
SELECT buyer, SUM(buy_count) FROM cart GROUP BY buyer;
HAVING SUM(buy_count) >= 2;
```
- GROUP BY로 만든 테이블에서는 조건을 HAVING을 사용한다.

# 10. 서브쿼리
```sql
-- book테이블에서 가장 가격이 높은 도서 정보 가져오기
SELECT book_title, book_price FROM book
WHERE book_price = (SELECT MAX(book_price) FROM book);
```
## 함수종류
### ANY()
```sql
select *
from student
where id = any('1001', '1002', '1003')
-- 1001, 1002, 1003 중 하나라도 만족하는 id를 포함하는 전체 행을 출력
```
- 주로 서브쿼리에서 사용하는 다중 행 연산자이다. 조건을 만족하는 값이 하나라도 있다면 결과를 리턴한다.

### ALL()
```sql
select *
from student
where id = all('1001', '1002', '1003')
-- 1001, 1002, 1003 모두를 가지는 값을 반환한다.
```
- 주로 서브쿼리에서 사용하는 다중 행 연산자이다. 모든조건을 만족하는 결과를 리턴한다.
