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
     primary key (employee_id)
);

 -- 부서 테이블
create table Departments (
    department_id         int,
    department_name       varchar(30),
    manager_id            int,
    location_id           int,
    primary key (department_id)
);



-- 회사 위치 테이블
create table Locations (
    location_id     int,
    street_address  varchar(50) not null,
    postal_code     varchar(12) ,
    city            varchar(25) not null,
    state_province  varchar(25) not null,
    country_id      char(2),
    primary key (location_id)
);
-- 국가 정보 테이블
create table Countries (
    country_id   char(2),
    country_name varchar(60)     not null,
    region_id    int,
    primary key (country_id)
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
    primary key (employee_id, start_data)
);
-- 직무 테이블
create table Jobs (
    job_id           varchar(15),
    jod_title        varchar(30)    not null,
    min_salary       decimal(6,2),
    max_salary       decimal(6,2),
    primary key (job_id)
);


delete from employees;
delete from DEPARTMENTS;
delete from LOCATIONS;
delete from COUNTRIES;
delete from REGIONS;
delete from JOB_HISTORY;
delete from JOBS;

select * from DEPARTMENTS;
select * from EMPLOYEES;
select * from REGIONS;
select * from LOCATIONS;
select * from JOB_HISTORY;
select * from JOBS;
select * from COUNTRIES;
