# 섹션7:문자열 함수

## 외부 sql파일 실행법

- source 키워드
  - CLI에서만 가능하고 source 오른쪽에 실행하고자 하는 sql파일 경로를 입력해주면된다.

## 문자열 함수의 종류

### CONCAT() & CONCAT_AS()

```sql
SELECT author_fname, author_lname FROM books;
SELECT CONCAT('Hello', ' ', 'World');
SELECT
	CONCAT(author_fname, ' ', author_lname) AS full_name
FROM books;
SELECT author_fname,
	CONCAT(author_fname, ' ', author_lname) AS full_name
FROM books;
SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full
FROM books;
SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full,
CONCAT(author_lname, ' ', author_fname) AS reverse_full
FROM books;

SELECT
	CONCAT_WS('-', title, author_fname, author_lname)
FROM books;
```

- 칼럼의 값들을 연결시켜 나타내고 싶을때 사용하는 함수이다.

### SUBSTR()

- SUBSTR(str, idx, (len))
- mysql에서는 idx가 1부터 시작한다.
  - ... -3,-2,-1,1,2,3 ...
- len만큼 반환하며 len을 작성하지 않으면 문자열 끝까지 반환한다.
- mysql에서 SUBSTR() 은 SUBSTRING() 과 동의어이다.
  - 주로쓰는 언어에 맞춰서 둘중 하나를 사용하도록 하자..
