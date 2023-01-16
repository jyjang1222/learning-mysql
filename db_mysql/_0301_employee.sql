CREATE DATABASE _employee;

USE _employee;

CREATE TABLE dept( 
  deptno     int, 
  dname      VARCHAR(14), 
  loc        VARCHAR(13)
);

CREATE TABLE emp( 
  empno   INT, 
  ename    VARCHAR(10), 
  job      VARCHAR(9), 
  mgr      int, 
  hiredate date, 
  sal      int, 
  comm     int, 
  deptno   int
  
);

CREATE TABLE bonus(
  ename VARCHAR(10),
  job   VARCHAR(9),
  sal   int,
  comm  int
);
 
CREATE TABLE salgrade(
  grade int,
  losal int,
  hisal int
);

/*
    # 사원 정보가 들어있는 EMP 테이블
    EMP = employee의 약어. 사원 데이터를 보관 및 관리하는 테이블.

    # EMP 테이블 구성 살펴보기
    . EMPNO     사원 번호
    . ENAME     사원 이름
    . JOB       사원 직책
    . MGR       직속 상관의 사원 번호. manager의 약어.
    . HIREDATE  입사일
    . SAL       급여
    . COMM      급여 외 추가 수당. commission의 약어.
    . DEPTNO    사원이 속한 부서 번호. department number의 약어.
*/
DESC EMP;

/*
    # 회사 부서 정보가 들어 있는 DEPT 테이블
    DEPT = department의 약어. 회사를 구성하는 부서 데이터를 관리하는 테이블.

    # DEPT 테이블 구성 살펴보기
    . DEPTNO    부서 번호
    . DNAME     부서 이름
    . LOC       부서가 위치한 지역
*/
DESC DEPT;

/*
    # 사원들의 급여 정보가 들어 있는 SALGRADE 테이블
    SALGRADE = salary grade의 약어. EMP 테이블에서 관리하는 사원들의 급여와 관련된 테이블
    
    # SALGRADE 테이블 구성 살펴보기
    . GRADE     급여 등급
    . LOSAL     급여 등급의 최소 급여액
    . HISAL     급여 등급의 최대 급여액
*/

DESC SALGRADE;


