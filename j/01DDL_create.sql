-- 고객 테이블
create table Customers (
    cid   char(18),
    name  char(15) not null,
    age   int     not null,
    grade varchar(6)  default 'silver',
    job   varchar(20)  not null,
    mileage int    default 0,
    primary key (cid)
);

-- 제품 테이블
create table Products (
    pid     char(3),
    pname   char(15),
    stock   int,
    price   int,
    maker   varchar(12),
    primary key (pid)
);

-- 주문 테이블
create table Orders (
    oid     char(20),
    cid     char(20),
    pid     char(20),
    qty     int,
    addr    varchar(25),
    odate   date,
    primary key (oid)
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
    bookname    char(25) not null,
    publisher   varchar(15) not null,
    price       int,
    primary key (bookid)
);

create table clients (
    cid     int,
    name    char(15) not null,
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
    primary key (oid)
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