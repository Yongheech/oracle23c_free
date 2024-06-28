-- 고객 테이블
create table Customers (
   cid   varchar(3),
   name  varchar(15) not null,
   age   int         not null,
   grade varchar(6)  default 'silver',
   job   varchar(20)  not null,
   mileage int    default 0,
   primary key (cid)
);

-- 제품 테이블
create table Products (
  pid     varchar(3),
  pname   varchar(15),
  stock   int,
  price   int,
  maker   varchar(12),
  primary key (pid)
);

-- 주문 테이블
create table Orders (
    oid     varchar(3),
    cid     varchar(3),
    pid     varchar(3),
    qty     int,
    addr    varchar(25),
    odate   date,
    primary key (oid),
    foreign key (cid) references Customers (cid),
    foreign key (pid) references Products (pid)
);

-- 한글 1byte는 영문 2byte
-- 오라클은 3byte
select length('abc123'), lengthb('abc123') from dual;
select length('가나다'), lengthb('가나다') from dual;

-- 테이블 삭제 : drop table
drop table Customers;
drop table Products;
drop table Orders;

---

create table Books (
       bookid      int,
       bookname    varchar(25) not null,
       publisher   varchar(15) not null,
       price       int,
       primary key (bookid)
);

create table clients (
         cid     int,
         name    varchar(15) not null,
         addr    varchar(25) not null,
         phone   char(13),
         primary key (cid)
);

create table Spells (
        oid         int,
        cid         int,
        bookid      int,
        saleprice   int,
        orderdate   date,
        primary key (oid),
        foreign key (bookid) references  Books (bookid),
        foreign key (cid)    references  clients (cid)
);

---

create table Students (
                          hakbun      int,
                          name        char(15) not null,
                          addr        varchar(25) not null,
                          birth       char(10)    not null,
                          deptname    char(15)    not null,
                          prof        char(3)     not null,
                          primary key (hakbun)
);

create table Depts (
                       deptname    char(15),
                       phone       char(15)    not null,
                       deptpos     varchar(10) not null,
                       chief       char(3)     not null,
                       primary key (deptname)
);

create table Subjects (
                          sid         char(4),
                          subjname    char(20)      not null,
                          subjdesc    varchar(35)   not null,
                          prof        char(3)       not null,
                          primary key (sid)
);

create table Professors (
                            pid     char(3),
                            name    char(10) not null,
                            fieid   varchar(15) not null,
                            primary key (pid)
);

---

select * from Products;
select * from Customers;

--- 생선순서 : regions - countries - locations - departments
    ---      jobs - employess -job_history

-- 직원 테이블
create table Employees (
   employee_id           int,
   first_name            varchar(25)  not null,
   last_name             varchar(25)  not null,
   email                 varchar(50)  not null,
   phone_number          varchar(20)  not null,
   hire_date             date         not null,
   job_id                varchar(15)  not null,
   salary                decimal(6,2),
   commission_pct        decimal(4,2),
   manager_id            int,
   department_id         int,
   primary key (employee_id),
   foreign key (manager_id)           references EMPLOYEES(employee_id),
   foreign key (department_id)        references DEPARTMENTS (department_id),
   foreign key (job_id)               references JOBS (job_id)
);

-- 부서 테이블
create table Departments (
     department_id         int,
     department_name       varchar(30),
     manager_id            int,
     location_id           int,
     primary key (department_id),
     foreign key (location_id) references LOCATIONS (location_id)
);



-- 회사 위치 테이블
create table Locations (
       location_id     int,
       street_address  varchar(50) not null,
       postal_code     varchar(12) ,
       city            varchar(25) not null,
       state_province  varchar(25) not null,
       country_id      char(2),
       primary key (location_id),
       foreign key (country_id) references  COUNTRIES (country_id)
);
-- 국가 정보 테이블
create table Countries (
       country_id   char(2),
       country_name varchar(60)     not null,
       region_id    int,
       primary key (country_id),
       foreign key (region_id) references REGIONS (region_id)
);


-- 지역 정보 테이블
create table Regions (
     region_id    int,
     region_name  varchar(30)     not null,
     primary key (region_id)
);

-- 직무이력 테이블
create table Job_history (
     employee_id         int,
     start_data          date,
     end_data            date,
     job_id              varchar(15),
     department_id       int,
     primary key (employee_id, start_data),
     foreign key (department_id) references Departments (department_id),
     foreign key (job_id) references JOBS(job_id),
     foreign key  (employee_id) references Employees(employee_id)
);
-- 직무 테이블
create table Jobs (
  job_id           varchar(15),
  jod_title        varchar(30)    not null,
  min_salary       decimal(6,2),
  max_salary       decimal(6,2),
  primary key (job_id)
);



--- 제약조건 조회
select * from ALL_CONSTRAINTS
where tabel_name = 'EMPLOYEES';


SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE table_name = 'EMPLOYEES';


---
-- 만든순서에 역순
drop table JOB_HISTORY;
drop table EMPLOYEES;
drop table JOBS;
drop table DEPARTMENTS;
drop table LOCATIONS;
drop table COUNTRIES;
drop table REGIONS;
---

-- 직원 테이블
create table Employees (
   employee_id           int,
   first_name            varchar(25)   constraint  fname_nn not null,
   last_name             varchar(25)   constraint  lname_nn not null ,
   email                 varchar(50)   constraint  email_nn not null ,
   phone_number          varchar(20)   constraint  phone_nn not null ,
   hire_date             date          constraint  hire_nn   not null,
   job_id                varchar(15)  constraint  job_nn not null ,
   salary                decimal(6,2),
   commission_pct        decimal(4,2),
   manager_id            int,
   department_id         int

);

-- 부서 테이블
create table Departments (
 department_id         int,
 department_name       varchar(30) constraint DEPARTMENTS not null ,
 manager_id            int,
 location_id           int

);



-- 회사 위치 테이블
create table Locations (
   location_id     int,
   street_address  varchar(50) constraint street_nn not null ,
   postal_code     varchar(12) ,
   city            varchar(25) constraint city_nn not null ,
   state_province  varchar(25) constraint state_nn  not null ,
   country_id      char(2)

);
-- 국가 정보 테이블
create table Countries (
   country_id   char(2),
   country_name varchar(60)
   constraint  clients_nn not null,
   region_id    int
);


-- 지역 정보 테이블
create table Regions (
     region_id    int,
     region_name  varchar(30)
     constraint   rgname_nn not null
);

-- 직무이력 테이블
create table Job_history (
     employee_id         int not null ,
     start_data          date,
     end_data            date,
     job_id              varchar(15) constraint JOB_HISTORY not null,
     department_id     int

);
-- 직무 테이블
create table Jobs (
      job_id           varchar(15),
      jod_title        varchar(30) constraint JOBS_nn  not null,
      min_salary       decimal(6,2),
      max_salary       decimal(6,2)

);

--- 기본키 제약조건 추가
alter table REGIONS
    add  constraint region_pk primary key (region_id);
alter table COUNTRIES
    add  constraint con_pk primary key (country_id);
alter table Locations
    add  constraint Locations_pk primary key (location_id);
alter table DEPARTMENTS
    add  constraint dpk_pk primary key (department_id);
alter table EMPLOYEES
    add  constraint emp_pk primary key (employee_id);
alter table JOBS
    add  constraint jb_pk primary key (job_id);
alter table JOB_HISTORY
    add  constraint jbh_pk primary key (employee_id, start_data);


--- 왜래키 제약조건 추가
alter table Countries
    add  constraint cnty_fk
        foreign key  (region_id) references REGIONS (region_id);

alter table LOCATIONS
    add  constraint loc_fk
        foreign key  (country_id) references Countries (country_id);
alter table DEPARTMENTS
    add  constraint dpk_fk
        foreign key  (location_id) references LOCATIONS (location_id);
alter table EMPLOYEES
    add  constraint emp_fk
        foreign key  (manager_id) references EMPLOYEES (employee_id);
alter table EMPLOYEES
    add  constraint emp2_fk
        foreign key  (department_id) references DEPARTMENTS (department_id);
alter table EMPLOYEES
    add  constraint emp3_fk
        foreign key  (job_id) references JOBS (job_id);
alter table  JOB_HISTORY
    add  constraint jo_fk
        foreign key  (employee_id) references EMPLOYEES (employee_id);

alter table JOB_HISTORY
    add  constraint job_fk
        foreign key  (department_id) references DEPARTMENTS  (department_id);
alter table  JOB_HISTORY
    add  constraint job2_fk
        foreign key  (job_id) references JOBS (job_id);






SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE table_name = 'JOB_HISTORY';


SELECT constraint_name, constraint_type
FROM all_constraints
WHERE constraint_name = 'job2_fk';

alter table LOCATIONS drop constraint JO_fk;


----

create table a (
    a int
);

alter table a add (b char(5));
alter table a modify (b varchar(10) not null );
alter table a rename column b to c;
alter table a drop column c;

alter table LOCATIONS modify (city varchar(255));
