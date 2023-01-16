/*
    [개념 1] SELECT문
    (1) 정의
        데이터베이스에 보관되어 있는 데이터 조회
    (2) 기본 형식
        SELECT [열 이름]
        FROM [테이블 이름];
*/
-- [개념 1-1] *로 테이블 전체 열 출력하기 
-- [실습 1-1] EMP 테이블 전체 열 조회하기

SELECT * FROM EMP;

-- [개념 1-2] 테이블 부분 열 출력하기
-- [실습 1-2] 열을 쉼표로 구분하여 출력하기

SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;   

----------------------------------------------------------------------------------------------

/*
    [개념 2] DISTINCT
    (1) 정의
        데이터의 중복을 제거
*/
-- [개념 2-1](열이 한 개인 경우)DISTINCT로 열 중복 제거하기
-- [실습 2-1] 중복없이 부서번호만 출력하기

SELECT DISTINCT DEPTNO
    FROM EMP;
    
-- [개념 2-2] (열이 여러 개인 경우)DISTINCT로 열 중복 제거하기 (두내용을 합쳐서 중복 제거)
-- [실습 2-2] 중복없이 직책과 부서번호 출력하기

SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
    
-- [개념 2-3] ALL로 중복되는 열 제거 없이 그대로 출력하기
-- [실습 2-3] 직책, 부서 번호 출력하기(ALL 사용)

SELECT ALL JOB, DEPTNO
    FROM EMP;

----------------------------------------------------------------------------------------------

/*
    [개념 3] 별칭 설정하기 AS
    (1) 정의
        본래 열 이름 대신 붙이는 이름을 별칭(alias)이라고 한다.
    (2) 별칭 을 사용할때 쌍따옴표가 없이 사용하면 대문자로 표시되고, 
        쌍따옴표를 사용하면 소문자 띄어쓰기 등을 사용할수있다. 
*/
-- [실습 3-1] 별칭을 사용하여 사원의 연간 총 수입 출력하기
-- COMM에 NULL 값이 들어있는 열에는 데이터가 출력되지 않는다.(*)
-- 


select ename , sal , comm , sal * 12 + comm from emp;

SELECT ENAME, SAL, COMM, SAL*12+COMM AS ANNSAL      -- ANNSAL(annual salary, 연봉)
    FROM EMP;

SELECT ENAME, SAL, COMM, SAL*12+COMM AS "annual salary"     
    FROM EMP;

----------------------------------------------------------------------------------------------

/*
    [개념 4] ORDER BY
    (1) 정의
        어떤 기준으로 데이터를 정렬
    (2) 기본 형식
        SELECT [열 이름]
        FROM [테이블 이름]
        (그 밖의 절)
        ORDER BY [정렬하려는 열 이름] [정렬 옵션];
    (3) 정렬 옵션을 지정하지 않을 경우 기본값으로 오름차순(ASC)이 설정된다.
    (4) 오름차순(ASC, ascending), 내림차순(DESC, descending)
*/
-- [실습 4-1] EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬하기

SELECT *
    FROM EMP
ORDER BY SAL;

-- [실습 4-2] EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기

SELECT *
    FROM EMP
ORDER BY SAL DESC;

-- [개념 4-3] 각각의 열에 내림차순과 오름차순 동시에 사용하기
-- [실습 4-3] EMP 테이블의 전체 열을 부서 번호(오름차순)와 급여(내림차순)로 정렬하기
-- 작성된 순서대로 부서 번호 열을 기준으로 먼저 오름차순으로 정렬한 후에
-- 부서 번호 열 값이 같은, 즉 같은 부서에서 근무하고 있는 사원들끼리는 
-- 급여가 높은 사원부터 낮은 사원으로 내림차순으로 정렬하여 출력

SELECT *
    FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;





----------------------------------------------------------------------------------------------

-- [문제 4-1] EMP 테이블에서 사원 번호와 부서 번호만 조회하기
-- [정답 4-1]

SELECT EMPNO, DEPTNO
    FROM EMP;
    
-- [문제 4-2] EMP 테이블의 JOB열 데이터를 중복 없이 출력하기
-- [정답 4-2]

SELECT DISTINCT JOB
    FROM EMP;
    
-- [문제 4-3] EMP 테이블의 모든 열을 사원 번호 기준으로 오름차순 정렬하기
-- [정답 4-3]

SELECT *
    FROM EMP
ORDER BY EMPNO;

-- [문제 4-4] EMP 테이블의 모든 열을 사원 번호 기준으로 내림차순 정렬하기
-- [정답 4-4]

SELECT *
    FROM EMP
ORDER BY EMPNO DESC;

-- [문제 4-5] 다음의 모든 조건을 만족하는 SQL문 작성하기
-- [조건 4-1] 조회할 테이블은 EMP 테이블이며 모든 열을 출력한다.
-- [조건 4-2] 출력되는 열의 별칭은 다음과 같다.
--          EMPNO열      ▶ EMPLOYEE_NO
--          ENAME 열     ▶ EMPLOYEE_NAME
--          MGR열        ▶ MANAGER
--          SAL열        ▶ SALARY
--          COMM열       ▶ COMMISSION
--          DEPTNO열     ▶ DEPARTMENT_NO
-- [조건 4-3] 부서 번호를 기준으로 내림차순으로 정렬하되
--         부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬한다.
-- [정답 4-5]

SELECT EMPNO AS EMPLOYEE_NO,
       ENAME AS EMPLOYEE_NAME,
       MGR AS MANAGER,
       SAL AS SALARY,
       COMM AS COMMISSION,
       DEPTNO AS DEPARTMENT_NO
    FROM EMP
ORDER BY DEPTNO DESC, ENAME ASC;