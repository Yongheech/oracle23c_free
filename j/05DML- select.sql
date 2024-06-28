-- select 는 SQL 에서 가장 중요하고 유용한 명령 중에 하나.
-- 데이터를 조회하고 검색하는데 주로 사용
-- select 속성들,...
-- from 테이블명
-- where 조건절
-- order by 정렬조건;

-- 1. 기본적인 테이블 컬럼 조회
-- 1) 고객테이블에서 아이디,이름,등급을 조회하세요
select CID, NAME, GRADE
from   CUSTOMERS;

-- 2) 고객테이블에서 모든 컬럼을 조회하세요
select cid, name, age, grade, job, mileage
from CUSTOMERS;

select * from CUSTOMERS;

-- 3) 제품테이블에서 제조업체를 조회하세요
-- all : 중복을 허용해서 존재하는 모든 값을 조회 (기본)
-- distinct : 중복을 제거해서 한개의 값만 조회
select MAKER
from PRODUCTS; --  업체가 중복 출력됨

select ALL MAKER -- 중복 출력
from PRODUCTS;

select distinct MAKER -- 중복 되는 이름 제거
from PRODUCTS;

-- 3) 제품테이블에서 제조업체를 조회하세요
-- 단, 총 몇개의 업체가 있는지 알아봅니다
select count(MAKER)
from PRODUCTS;

select count(distinct MAKER)
from PRODUCTS;


-- 2. 테이블 컬럼 조회시 조회결과 컬럼명을 변경
-- select 속성이름 as 새속성이름  from 테이블명;
-- as는 생략 가능

-- 4) 제품테이블에서 제품명과 가격을 조회하되
-- 컬럼명을 한글로 바꿔 출력하세요
select PNAME, PRICE
from PRODUCTS;

select PNAME as 제품명 , PRICE as 가격
from PRODUCTS;

select PNAME  제품명 , PRICE  가격
from PRODUCTS;

select PNAME  제품명 , PRICE as "제품 단가"
from PRODUCTS;

-- 3. 산술식을 이용한 검색
-- select 사용시 산술연산자를 이용해서 조회 가능
-- select 산술식 from 테이블명

-- 5) 제품테이블에서 제품명과 가격을 조회하고
-- 가격에 500원을 더해 '2021년 단가'라는 별칭을 가진
-- 새로운 컬럼도 함께 출력하세요
select PNAME, PRICE, PRICE + 500 "2021 단가(500원 인상)"
from PRODUCTS;
-- 5) 모든 회원의 적립금을 1000씩 추가해주었을때의
-- 결과를 알아보려고 한다. 적절한 질의문을 작성하세요
select cid, MILEAGE"수정전 적립금", MILEAGE + 1000 "수정후 적립금 "
from CUSTOMERS;

-- 4. 조건식을 이용한 검색
-- 조건을 만족하는 데이터만 검색할때 사용
-- where 라는 예약어를 사용하고
-- 비교연산자, 논리연산자등으로 구성된 조건식 필요
-- select 속성명 from 테이블명 where 조건식;

-- 6) 제품테이블에서 한빛제과가 제조한 제품의
-- 제품명, 재고량, 단가를 조회하세요
select  PNAME, STOCK, PRICE
from PRODUCTS;   -- 모두 조회


select  PNAME, STOCK, PRICE
from PRODUCTS
where maker = '한빛제과';

-- 7) 주문테이블에서 apple 이라는 고객이
-- 15개 이상 주문한 주문제품, 수량, 주문일자를 조회하세요
select  PID, QTY, ODATE
from ORDERS
where cid = 'apple';

select  PID, QTY, ODATE
from ORDERS
where QTY >=15;

select  PID, QTY, ODATE
from ORDERS
where CID ='apple' and QTY >= 15 ;
-- 7) 주문테이블에서 apple 이라는 고객이 주문했거나
-- 15개 이상 주문된 주문제품, 수량, 주문일자를 조회하세요

select PID, QTY , ODATE
from ORDERS
where CID ='apple' or QTY >= 15 ;



-- 8) 제품테이블에서 단가가 2000원이상이고
-- 3000원이하인 제품의 제품명, 단가, 제조업체를 조회하세요
select PID, PRICE, MAKER
from PRODUCTS
where PRICE >= 2000 and PRICE <= 3000;
-- 2000 >= price <= 3000
select PID, PRICE, MAKER
from PRODUCTS
where PRICE between 2000 and 3000;

--5 . Like 검색
-- 문자열 패턴 매칭을 위해 사용하는 기능
-- 즉, where 절에서 특정 패턴과 일치하는 데이터를 검색할 때 사용
-- 와일드 카드 문자
-- % : 0개 이상 임의의 문자를 나타냄
-- _ : 정확하게 1개의 임의의 문자를 나타냄
-- 주요 패턴 예
-- 'a%' :
-- '%a' :
-- '%a%' :
-- 'a___':
-- '___a':
-- '_a_':
-- '_a :
-- 'a_% :

-- 고객 테이블에서 성이 김씨인 고객의
-- 고객이름, 나이, 등급 , 적립금을 검색하세요
select NAME, AGE, GRADE, MILEAGE
from CUSTOMERS
where NAME like '김%';

select NAME, AGE, GRADE, MILEAGE
from CUSTOMERS
where NAME like '김__';

-- 고객 테이블에서 고객아이디가 5자인
-- 고객의 고객아이디가, 고객이름, 등급을 검색하세요
select CID, NAME, GRADE
from CUSTOMERS
where CID like '_____';

-- 6. NULL 검색
-- 데이터베이스에서 null은 ' 알수없는 값', '적용할 수 없는 값' 을 의미
-- 따라서, 일반적인 연산자로는 처리할 수 없음


-- 9) 고객 테이블에서 나이가 입력되지 않은 고객을
-- 조회하세요
select AGE from CUSTOMERS   -- 안되는 예
where AGE = null;


select  * from  CUSTOMERS
where AGE is NULL;


-- 고객 테이블에서 나이가 입력된 고객을 조회하세요
select  * from  CUSTOMERS
where AGE is NOT NULL;

select NAME, AGE from CUSTOMERS
where AGE is NOT NULL;

select * from CLIENTS;
select * from BOOKS;
select * from SPELLS;

-- A1 (Clients, Book, Spells)

-- 1) 모든 도서의 이름과 가격을 조회하세요
select BOOKNAME, PRICE
from  BOOKS;
-- 1b) 모든 도서의 가격, 이름을 조회하세요
select PRICE, BOOKNAME
from  BOOKS;

-- 2) 모든 도서의 번호,이름, 출판사,가격을 조회하세요
select BOOKID, BOOKNAME, PUBLISHER, PRICE
from  BOOKS;
-- 2b) 모든 도서의 정보를 조회하세요
select * from BOOKS;

-- 3) 모든 도서의 출판사를 조회하세요
select PUBLISHER
from  BOOKS;


-- 3b) 모든 도서의 출판사를 조회하세요 (중복제거)
select distinct PUBLISHER
from  BOOKS;
-- 4) 고객의 이름, 주민번호를 조회하세요
-- 단, 출력결과의 필드명을 '이름,주민번호'로 바꿔 출력
select NAME 이름 , PHONE 주민번호
from CLIENTS;

-- 5) 고객의 이름과 핸드폰번호를 조회하세요
select NAME, PHONE
from CLIENTS;

-- 6) 가격이 20000미만인 도서를 조회하세요
select PRICE
from BOOKS
where PRICE < 20000;
-- 7) 가격이 15000이상 ~ 25000이하인 도서의 제목을 조회하세요
select PRICE
from BOOKS
where PRICE >= 15000 and PRICE<= 25000 ;

-- 8) 책이름이 '축구의 역사' 또는 '피겨 교본'인 도서의 출판사를 조회하세요
select BOOKNAME
from BOOKS
where BOOKNAME = '축구의 역사' or  BOOKNAME ='피겨 교본';

-- 9) '축구'로 시작하는 도서 이름을 조회하세요
select BOOKNAME
from BOOKS
where BOOKNAME like '축구%';

-- 9b) '축구'로 끝나는 도서 이름을 조회하세요
select BOOKNAME
from BOOKS
where BOOKNAME like  '%축구';

-- 9c) '축구'를 포함하는 도서 이름을 조회하세요
select BOOKNAME
from BOOKS
where BOOKNAME like '%축구%';

-- 9d) 도서이름 중에 '의'를 포함하는 책은?
select BOOKNAME
from BOOKS
where BOOKNAME like '%의%';

-- 10) '골프'를 포함하고 가격이 30000이상인 도서 이름을 조회하세요
select BOOKNAME , PRICE
from BOOKS
where BOOKNAME like '%골프%' >= 30000;

-- 11) 고객이름을 가나다순으로 오름차순 정렬하고
-- 이름이 같으면 주소로 내림차순 정렬해서 조회하세요
select NAME
from CLIENTS
order by



select CID,  ADDR
from CLIENTS
where CID = '가나다'


select * from EMPLOYEES;

--B1 (HR)

-- 1. 모든 사원의 이름(FIRST_NAME, LAST_NAME)을 조회하라.
select FIRST_NAME, LAST_NAME
from EMPLOYEES;


-- 2. 모든 사원의 모든 정보를 조회하라.
select * from EMPLOYEES;

-- 3. 모든 도시 명을 조회하라.
select CITY
from LOCATIONS;


-- 4. 이름(FIRST_NAME)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
from EMPLOYEES
where FIRST_NAME like  'M%';

-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.
select FIRST_NAME , SALARY
from EMPLOYEES
where FIRST_NAME like '_a_';

-- 6. 도시 명을 오름차순 정렬하라.
select CITY
from LOCATIONS
order by to_char(CITY) asc;

-- 7. 부서 명을 내림차순 정렬하라.
select CITY
from LOCATIONS
order by to_char(CITY) desc ;

-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.


-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.


-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.


-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 그리고 부서번호를 조회하라.


-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.


-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.


-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.


-- 15. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.


-- 16. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.


-- 17. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.


-- 18. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.


-- 19. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.


-- 20. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.


-- 21. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.


-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.

