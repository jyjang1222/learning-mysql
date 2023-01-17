# 집계함수
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