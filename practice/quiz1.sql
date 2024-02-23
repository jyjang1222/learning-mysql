# 컬럼 전부 가져오기
SELECT * FROM member;
SELECT * FROM cart;
SELECT * FROM book;
# [문제] 회원의 번호, 이름 가져오기
SELECT member_no, member_name FROM member;
# [문제] 책의 번호, 이름, 가격 가져오기
SELECT book_no, book_title, book_price FROM book;
# [문제] 장바구니의 번호, 구입한 회원의 id, 구입한 책제목 가져오기
SELECT cart_no, buyer, book_title FROM cart;
# [문제] 각 도서의 가격을 10% 인상한 금액 출력
SELECT book_price, book_price*1.1 FROM book;
# [문제] 각 도서의 가격을 10% 인하한 금액 출력
SELECT book_price, book_price*0.9 FROM book;

# [문제] member테이블에서 id가 qwer인 회원의 이름과 비밀번호 가져오기
SELECT member_id, member_name, member_pw FROM member WHERE member_id='qwer';
# [문제] book테이블에서 book_kind가 문학(100)인 책정보 가져오기
SELECT * FROM book WHERE book_kind=100;
# [문제] book테이블에서 가격이 15,000원 이하인 책정보 가져오기
SELECT * FROM book WHERE book_price <= 15000;
# [문제] book테이블에서 문학(100)이 아닌 책정보만 가져오기
SELECT * FROM book WHERE book_kind <> 100;
# [문제] book테이블에서 2020년 이전에 등록된 책정보만 가져오기
SELECT * FROM book WHERE book_reg_date < '2020-01-01';
# [문제] book테이블에서 컴퓨터(300)이면서 가격이 15,000원 이상인 책정보 가져오기
SELECT * FROM book WHERE book_kind='300' AND book_price >= 15000;
# [문제] book테이블에서 재고가 없는 책정보 가져오기
SELECT * FROM book WHERE book_count=0;
# [문제] book테이블에서 문학(100)이거나 컴퓨터(300)인 책정보 가져오기
SELECT * FROM book WHERE book_kind='100' OR book_kind='300';
# [문제] book테이블에서 할인률이 없는 책정보 가져오기
SELECT * FROM book WHERE book_discount_rate=0;
# [문제] book테이블에서 할인률이 있는 책정보 가져오기
SELECT * FROM book WHERE book_discount_rate>0;


# [문제] book테이블에서 책 제목에 'java'가 포함되어 있는 책정보 가져오기
SELECT * FROM book WHERE book_title LIKE '%java%';
# [문제] book테이블에서 책 제목에 'java' 또는 '자바' 가 포함되어 있는 책정보 가져오기
SELECT * FROM book WHERE book_title LIKE '%java%' OR book_title LIKE '%자바%';
# [문제] book테이블에서 책 제목이 '나'로 시작되는 책정보 가져오기
SELECT * FROM book WHERE book_title LIKE '나%';
# [문제] book테이블에서 책 제목이 '외국어'로 끝나는 책정보 가져오기
SELECT * FROM book WHERE book_title LIKE '%외국어';
# [문제] member테이블에서 이름이 4글자인 회원정보 가져오기
SELECT * FROM member WHERE member_name LIKE '____';

# [문제] book테이블에서 도서명과 출판일 가져오기 [조건] 출판일을 기준으로 정렬
SELECT book_title, book_reg_date FROM book ORDER BY book_reg_date;
# [문제] book테이블에서 도서명에 '자바'가 들어가는 도서 가져오기 [조건] 도서명을 기준으로 정렬
SELECT * FROM book WHERE book_title LIKE '%java%' OR book_title LIKE '%자바%' ORDER BY book_title;
# [문제] member테이블에서 회원의 가입 일자를 한글 날짜 형식으로 가져오기
SELECT CONCAT(YEAR(member_reg_date), '년', MONTH(member_reg_date), '월', DAY(member_reg_date), '일') FROM member;

# 문제) cart테이블에서 buyer의 이름과 cart의 가격 가져오기
SELECT m.member_name, c.buy_price FROM cart c, member m
WHERE c.buyer = m.member_id;
# 문제) cart테이블에서 회원이 구매한 도서의 할인되기 전의 가격과 할인율 가져오기
SELECT b.book_title, c.buy_price, b.book_price, b.book_discount_rate FROM cart c, book b
WHERE c.book_no = b.book_no;
# 문제) cart테이블에서 회원이 구매한 도서의 할인되기 전의 가격이 2만원 이상인 도서정보와 할인율 가져오기
SELECT c.buyer, b.book_title, book_price, b.book_discount_rate FROM cart c, book b
WHERE c.book_no = b.book_no AND b.book_price >= 20000;

# [문제] member테이블에서 전체 회원 수 가져오기
SELECT COUNT(*) FROM member;
# [문제] member테이블에서 남자 회원 수 가져오기
SELECT COUNT(*) FROM member WHERE member_gender='M';
# [문제] book테이블에서 전체 도서 가격의 총합 가져오기
SELECT SUM(book_price) FROM book;
# [문제] book테이블에서 전체 도서 가격의 평균 가져오기
# [조건] 소수점 이하 2자리까지 출력
SELECT TRUNCATE(AVG(book_price), 2) FROM book;
# [문제] book테이블에서 도서 가격을 10%로 인상했을 때의 총합 가져오기
SELECT SUM(book_price*1.1) FROM book;
# [문제] book테이블에서 도서 가격이 가장 높은 도서가격 가져오기
SELECT MAX(book_price) FROM book;

# [문제] member테이블에서 회원의 수를 성별로 가져오기
SELECT member_gender, COUNT(member_gender) FROM member GROUP BY member_gender;
# [문제] book테이블에서 도서 종류별 도서 수량 가져오기
SELECT book_kind, COUNT(*) FROM book GROUP BY book_kind;
# [문제] cart테이블에서 회원별로 구입한 총 수량 가져오기
# [조건] 내림차순 정렬하기
SELECT buyer, SUM(buy_count) FROM cart GROUP BY buyer ORDER BY SUM(buy_count) DESC;
# [문제] cart테이블에서 회원이 구입한 도서의 수량이 2개 이상인 회원의 id 가져오기
SELECT buyer, SUM(buy_count) FROM cart GROUP BY buyer HAVING SUM(buy_count) >= 2;
# /[문제] book테이블에서 2015년에서 2019년 사이에 출간한 도서 중에 재고 수량이 3개 이하인 도서를 종류별 개수 가져오기
SELECT book_kind, COUNT(book_kind) FROM book
WHERE '2015-01-01' <= book_reg_date AND book_reg_date < '2019-01-01' AND book_count < 3
GROUP BY book_kind;

# [문제] book테이블에서 전체 평균 가격보다 더 높은 도서정보 가져오기
SELECT AVG(book_price) FROM book;
SELECT book_title, book_price FROM book WHERE book_price > (SELECT AVG(book_price) FROM book);
# [문제] book테이블에서 가장 가격이 높은 도서 정보 가져오기
SELECT book_title, book_price FROM book WHERE book_price = (SELECT MAX(book_price) FROM book);
