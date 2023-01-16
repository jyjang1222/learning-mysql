
# 컬럼 전부 가져오기
SELECT * FROM member;
SELECT * FROM book;
SELECT * FROM cart;

# 컬럼 일부만 가져오기
# [문제] 회원의 번호, 이름 가져오기
SELECT member_no, member_name
FROM member;

# [문제] 책의 번호, 이름, 가격 가져오기
SELECT book_no, book_title, book_price 
FROM book;

# [문제] 장바구니의 번호, 구입한 회원의 id, 구입한 책제목 가져오기
SELECT cart_no, buyer, book_title 
FROM cart;

# 산술 연산자 
SELECT 20 + 10;
SELECT 20 - 10;
SELECT 20 * 10;
SELECT 20 / 10;

# [문제] 각 도서의 가격을 10% 인상한 금액 출력
SELECT book_title, book_price, book_price + book_price * 0.1
FROM book;

# [문제] 각 도서의 가격을 10% 인하한 금액 출력
SELECT book_title, book_price, book_price - book_price * 0.1
FROM book;



