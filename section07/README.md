# 섹션7:문자열 함수

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