CREATE DATABASE _bookshop;
USE _bookshop;
DROP DATABASE the_skin_shop;

CREATE TABLE member(
	member_no INT,
    member_id VARCHAR(20),
    member_pw VARCHAR(20),
    member_name VARCHAR(20),
    member_gender VARCHAR(1),
    member_point INT,
    member_reg_date DATETIME
);

DROP TABLE member;
DESC member;

CREATE TABLE book(
	book_no INT,
    book_kind VARCHAR(3),
    book_title VARCHAR(100),
    book_price INT,
    book_count INT,
    book_author VARCHAR(40),
    book_publishing_com VARCHAR(30),
    book_publishing_date VARCHAR(15),
    book_image VARCHAR(16),			
    book_content VARCHAR(500),
    book_discount_rate INT,				
    book_reg_date DATETIME
);

DESC book;

CREATE TABLE cart(
	cart_no INT,
    buyer VARCHAR(50),
    buy_price INT,
    buy_count INT,
    book_no INT,
    book_title VARCHAR(100),
    book_image VARCHAR(16)
);

DESC cart;

INSERT INTO member VALUES (1, 'qwer', '1234', '홍길동', 'm', 0, '2021-01-01 12:11:30');
INSERT INTO member VALUES (2, 'java', '1234', '김유신', 'm',  0, '2021-01-02 03:20:54');
INSERT INTO member VALUES (3, 'haha', '1234', '신혜정', 'w', 0, NOW()); -- now() 함수는 현재 날짜를 의미한다. 
INSERT INTO member VALUES (4, 'tiger', '1234', '선우호랭', 'w', 0, '2020-12-25 05:43:11');
INSERT INTO member VALUES (5, 'green', '1234', '정그린', 'm', 0, '2018-06-12 07:21:08');

SELECT * FROM member;

INSERT INTO book VALUES(1001, '100', '나미야 잡화점의 기적', 15000, 10, '히가시노 게이고', '현대문학', '2019-01-11', 'nothing.jpg', '일본을 대표하는 소설가 히가시노 게이고의 신작', 10, '2019-01-15');
INSERT INTO book VALUES(1002, '100', '연필로 쓰기', 18000, 80, '김훈', '문학동네', '2018-02-14', 'nothing.jpg', '70대의 김훈이 연필로 꾹꾹 눌러쓴 산문의 진경', 5, '2018-02-25');
INSERT INTO book VALUES(1003, '100', '인간 실격', 20000, 50, '다자이 오사무', '민음사', '2016-11-20', 'nothing.jpg', '2019 상반기 종합 베스트셀러', 0, '2016-11-23');
INSERT INTO book VALUES(1004, '100', '기묘한 신혼여행', 12000, 30, '정태원', '문학의 문학', '2017-04-20', 'nothing.jpg', '13편의 추리문학 걸작선', 20, '2017-04-21');
INSERT INTO book VALUES(1005, '100', '우리가 인생이라 부르는 것들', 16000, 10, '정재찬', '인플루엔셀', '2020-02-25', 'nothing.jpg', '자기 삶의 언어를 찾는 열네 번의 시 강의', 0, '2020-02-27');
INSERT INTO book VALUES(1006, '100', '어제의 세계', 18000, 80, '슈테판 츠바이크', '지식공작소', '2014-02-05', 'nothing.jpg', 'Die Welt von Gestern', 20, '2014-02-08');
INSERT INTO book VALUES(2001, '200', '외국어 공부의 감각', 15000, 10, '아키야마 요헤이', '월북', '2011-03-11', 'nothing.jpg', '나는 어떻게 10개 국어를 말하게 되었나?', 25, '2011-03-13');
INSERT INTO book VALUES(2002, '200', 'EBS 수능완성 고등 제2외국어', 28000, 20, 'EBS 편집부', 'EBS교육방송', '2014-08-14', 'nothing.jpg', '2014 학년도 수능 연계교재', 10, '2014-08-17');
INSERT INTO book VALUES(2003, '200', '외국어 전파담', 23000, 70, '로버트 파우저', '혜화', '2012-10-03', 'nothing.jpg', '외국어는 어디에서 어디로', 10, '2012-10-05');
INSERT INTO book VALUES(2004, '200', '아무튼,외국어', 22000, 50, '조지영', '위고', '2019-04-20', 'nothing.jpg', '모든 나라에는 철수와 영희가 있다', 10, '2019-04-28');
INSERT INTO book VALUES(2005, '200', '구슬쌤의 예의 바른 영어 표현', 15000, 10, '구슬', '사람in', '2021-01-04', 'nothing.jpg', '유튜브 24만 구독자 구슬쌤이 알려 주는 영어표현', 10, '2021-01-05');
INSERT INTO book VALUES(2006, '200', '시원스쿨 네이티브 5분 영어회화', 13500, 10, '박윤진', '시원스쿨닷컴', '2020-12-21', 'nothing.jpg', '하루 한 문장씩, 오늘 배워 내일 쓰는', 0, '2020-12-24');
INSERT INTO book VALUES(3001, '300', '컴퓨터 비전과 딥러닝', 35000, 70, '라쟈링가파 샨무갸마니', '에이콘', '2018-02-18', 'nothing.jpg', '텐서플로와 케라스를 사용한 전문 가이드', 5, '2018-02-22');
INSERT INTO book VALUES(3002, '300', '쉽게 배우는 데이터 통신', 19000, 10, '박기현', '한빛아카데미', '2015-03-10', 'nothing.jpg', '데이터 통신과 컴퓨터 네트워크', 10, '2015-03-11');
INSERT INTO book VALUES(3003, '300', '컴퓨터활용능력', 38000, 20, '이주희', '배움', '2012-09-24', 'nothing.jpg', '컴퓨터 자격증', 20, '2012-09-26');
INSERT INTO book VALUES(3004, '300', '초등학생이 알아야할 숫자', 22000, 0, '엘리스 제임스', '어스본코리아', '2013-06-12', 'nothing.jpg', '컴퓨터와 코디 100가지', 10, '2013-06-18');
INSERT INTO book VALUES(3005, '300', 'Java의 정석', 30000, 0, '남궁성', '도우출판', '2016-01-27', 'nothing.jpg', '자바의 기초부터 객체지향개념을 넘어 실정활용까지', 30, '2016-01-29');
INSERT INTO book VALUES(3006, '300', '은노기의 JSP 2.3 웹 프로그래밍', 38000, 0, '김은옥', '삼양미디어', '2014-11-20', 'nothing.jpg', '기초부터 모델2 기반의 MVC패턴까지', 10, '2014-11-22');
INSERT INTO book VALUES(3007, '300', '혼자 공부하는 자바', 24000, 1, '신용권', '한빛미디어', '2019-06-10', 'nothing.jpg', 'Java8 & 11 지원/무료 동영상 강의 제공', 10, '2019-06-19');
INSERT INTO book VALUES(3008, '300', '혼자 공부하는 자바스크립트', 24000, 0, '윤인성', '한빛미디어', '2021-01-04', 'nothing.jpg', '자바스크립트를 탄탄하게 시작하고 싶을 때', 10, '2021-01-09');
INSERT INTO book VALUES(3009, '300', '모던 자바 인 액션', 34000, 5, '라울', '한빛미디어', '2019-08-01', 'nothing.jpg', '전문가를 위한 자바 8,9,10 기법 가이드', 10, '2019-08-02');
 
SELECT * FROM book;

INSERT INTO cart VALUES(1, 'qwer', 21000, 1, 3005, 'Java의 정석', 'nothing.jpg');
INSERT INTO cart VALUES(2, 'tiger', 21000, 1, 3005, 'Java의 정석', 'nothing.jpg');
INSERT INTO cart VALUES(3, 'haha', 19800, 1, 2004, '아무튼,외국어', 'nothing.jpg');
INSERT INTO cart VALUES(4, 'tiger', 20000, 1, 1003, '인간 실격', 'nothing.jpg');
INSERT INTO cart VALUES(5, 'haha', 34200, 1, 3006, '은노기의 JSP 2.3 웹 프로그래밍', 'nothing.jpg');
INSERT INTO cart VALUES(6, 'tiger', 13500, 1, 1001, '나미야 잡화점의 기적', 'nothing.jpg');
INSERT INTO cart VALUES(7, 'tiger', 13500, 1, 1001, '나미야 잡화점의 기적', 'nothing.jpg');

SELECT * FROM cart;

UPDATE cart SET buyer='tiger2' WHERE cart_no=2;

UPDATE cart SET buyer='tiger3' WHERE cart_no=3;
DELETE FROM cart WHERE cart_no='7';

CREATE TABLE member1 (
	num INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    score INT
);

CREATE TABLE member2 (
	num INT,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY(num)
);

CREATE TABLE member3 (
	num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE account(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    amount DECIMAL(19, 4) NOT NULL
);

CREATE TABLE transferHistory(
	id INT AUTO_INCREMENT PRIMARY KEY,
    from_id INT NOT NULL,
    to_id INT NOT NULL,
    amount DECIMAL(19, 4) NOT NULL,
    trans_date DATETIME
);

INSERT INTO account(name, amount) VALUES('김철수', 1000000), ('박영희', 90000);

START TRANSACTION;
-- 철수의 잔액 - 500,000
UPDATE account SET amount = amount - 500000 WHERE id=1;
-- 영희의 잔액 + 500,000
UPDATE account SET amount = amount + 500000 WHERE id=2;
SELECT * FROM account;

INSERT INTO transferHistory(from_id, to_id, amount, trans_date)
VALUES(1, 2, 500000, NOW());
SELECT * FROM transferHistory;

ROLLBACK;
COMMIT;

SELECT * FROM account;
SELECT * FROM transferHistory;