create table GolfMember (
	Mno int primary key Auto_increment,
	MName varchar(30) not null,
	Phone varchar(13) unique,
	JoinDate date not null,
	Grade char(1) check(Grade In ('A','B','C'))
)

create table Lesson (
	LNo int primary key Auto_increment,
	MNo int,
	Coach varchar(30) not null,
	StartDate date not null,
	Fee int check (Fee >= 0),
	FOREIGN KEY (MNo) REFERENCES GolfMember(MNo)
)

Create table Usage (
	UNo int Primary key Auto_increment,
	Mno int,
	UDate date not null,
	Time int check (Time > 0),
	Cost int check (Cost >= 0),
	FOREIGN KEY (MNo) REFERENCES GolfMember(MNo)
)


Insert into GolfMember (MName, Phone, JoinDate, Grade) 
values
('홍길동', '010-1111-2222', '2020-01-01', 'A’),
('이순신', '010-3333-4444', '2021-05-10', 'B’),
('강감찬', '010-5555-6666', '2022-03-15', 'C’)

Insert into Lesson (Mno, Coach, StartDate, Fee) 
values
(1, '김프로', '2020-02-01', 300000),
(2, '박프로', '2021-06-01', 250000),
(3, '이프로', '2022-04-01', 200000)

Insert into Usage (MNo, UDate, Time, Cost) 
values
(1, '2020-02-10', 120, 24000),
(2, '2021-06-15', 90, 18000),
(3, '2022-04-20', 150, 30000)


-- 1. 조회
--1) A등급 회원의 이름, 전화번호, 가입일자를 조회

select MName, Phone, JoinDate from GolfMember where Grade = 'A'


-- 2) 강습비가 250000 이상인 강습 내역을 조회.

select * from Lesson where Fee >= 250000

-- 3) 회원별 총 이용요금을 집계. (회원명, 총요금)

SELECT m.MName, SUM(u.Cost) AS TotalCost
FROM GolfMember AS m
INNER JOIN Usage AS u ON m.MNo = u.MNo
GROUP BY m.MNo, m.MName;


-- 4. 수정

update GolfMember set Grade = 'A' where MName = '이순신';

-- 5. 삭제
-- MNO = 3인 회원을 삭제

delete from GolfMember where MNo=3;
delete from Lesson where MNo=3;
delete from Usage where MNo=3;


-- 등급별 통계 (등급, 회원수, 평균 강습비, 총 이용요금)을 조회

SELECT 
    m.Grade,
    COUNT(DISTINCT m.MNo) AS MemberCount,
    AVG(l.Fee) AS AvgLessonFee,
    SUM(u.Cost) AS TotalUsageCost
FROM 
    GolfMember AS m
    LEFT JOIN Lesson AS l ON m.MNo = l.MNo
    LEFT JOIN Usage AS u ON m.MNo = u.MNo
GROUP BY 
    m.Grade;




