-- 연습문제 풀이

--- 도서마당 #1
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
select NAME 이름 , JUMIN 주민번호
from CLIENTS;

alter table  CLIENTS add jumin varchar(18);


-- 5) 고객의 이름과 핸드폰번호를 조회하세요
select NAME, PHONE
from CLIENTS;

-- 6) 가격이 20000미만인 도서를 조회하세요
select PRICE
from BOOKS
where PRICE < 20000;
-- 7) 가격이 15000이상 ~ 25000이하인 도서의 제목을 조회하세요
select  BOOKNAME, PRICE
from BOOKS
where PRICE >= 15000 and PRICE<= 25000 ;

select BOOKNAME, PRICE
from BOOKS
where PRICE between 15000 and 25000;

-- 8) 책이름이 '축구의 역사' 또는 '피겨 교본'인 도서의 출판사를 조회하세요
select PUBLISHER
from BOOKS
where BOOKNAME = '축구의 역사' or  BOOKNAME ='피겨 교본';

select PUBLISHER
from BOOKS
where BOOKNAME IN ('축구의 역사','피겨 교본');

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
order by NAME asc , ADDR desc ;


select NAME
from CLIENTS
order by NAME desc  ;

---

select CID,  ADDR
from CLIENTS
where CID = '가나다'


select * from EMPLOYEES;


--- HR #1
--B1 (HR)

-- 1. 모든 사원의 이름(FIRST_NAME, LAST_NAME)을 조회하라.
select FIRST_NAME, LAST_NAME
from EMPLOYEES;


-- 2. 모든 사원의 모든 정보를 조회하라.
select employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
       salary, commission_pct, manager_id, department_id from EMPLOYEES;

select * from EMPLOYEES;

-- 3. 모든 도시 명을 조회하라.
select CITY
from LOCATIONS;


-- 4. 이름(FIRST_NAME)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
select *
from EMPLOYEES
where FIRST_NAME like  'M%';

-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.
select FIRST_NAME , SALARY
from EMPLOYEES
where FIRST_NAME like '_a%';

-- 6. 도시 명을 오름차순 정렬하라.
select CITY
from LOCATIONS
order by CITY asc;

SELECT DBMS_LOB.SUBSTR(CITY, 4000, 1) AS CITY
FROM LOCATIONS
ORDER BY DBMS_LOB.SUBSTR(CITY, 4000, 1) ASC;


-- 7. 부서 명을 내림차순 정렬하라.


-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
select


-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
select COMMISSION_PCT from EMPLOYEES;

select *
from EMPLOYEES
where COMMISSION_PCT IS null ;


-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
select *
from EMPLOYEES
where COMMISSION_PCT IS NOT null;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 그리고 부서번호를 조회하라.
select
     EMPLOYEE_ID, FIRST_NAME , LAST_NAME, DEPARTMENT_ID
from EMPLOYEES
where HIRE_DATE = '2007-6-21' ;
-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
-- 일반적인
select EMPLOYEE_ID, hire_date
from EMPLOYEES
where HIRE_DATE >= '2006-01-01' and  HIRE_DATE <= '2006-12-31';

select EMPLOYEE_ID, hire_date
from EMPLOYEES
where to_char(HIRE_DATE) >= '2006-01-01' and  to_char(HIRE_DATE) <= '2006-12-31';
-- char 값으로 하여서 출력한다는 뜻
select EMPLOYEE_ID, hire_date
from EMPLOYEES
where HIRE_DATE between '2006-01-01' and '2006-12-31';

select EMPLOYEE_ID, hire_date
from EMPLOYEES
where HIRE_DATE like '2006%';



select EMPLOYEE_ID, hire_date
from EMPLOYEES
where to_char (HIRE_DATE, 'YYYY') like '2006%';

-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.
select FIRST_NAME , LAST_NAME
from EMPLOYEES
where FIRST_NAME like '_____';

-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
select  FIRST_NAME, SALARY
from  EMPLOYEES
where SALARY < 5000 or SALARY > 12000;

select  FIRST_NAME, SALARY
from  EMPLOYEES
where SALARY NOT BETWEEN 5000 AND 12000;


-- 15. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
select LAST_NAME, DEPARTMENT_ID
from EMPLOYEES
where EMPLOYEE_ID = 176;
-- 16. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
select LAST_NAME , SALARY
from EMPLOYEES
where EMPLOYEE_ID >= 12000;
-- 17. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
select LAST_NAME , HIRE_DATE
from  EMPLOYEES
where HIRE_DATE like '1994%';
-- 18. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
select LAST_NAME , JOB_ID
from  EMPLOYEES
where MANAGER_ID is null ;
-- 19. 커미션을 버는 모든 사원들의 LAST_MAME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.


-- 20. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
select LAST_NAME ,FIRST_NAME
from  EMPLOYEES
where  LAST_NAME like '___a%';
-- 21. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
select LAST_NAME
from  EMPLOYEES
where LAST_NAME like '%a%' or LAST_NAME like '%e%';


-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
select *
from EMPLOYEES
where SALARY not in  (2500, 3500, 7000)
  and (JOB_ID) in ('SA_REP', 'ST_CLERK');

select *
from EMPLOYEES
where SALARY not in  (2500, 3500, 7000)
   and to_char(JOB_ID) in ('SA_REP', 'ST_CLERK');


