CREATE TABLE ShopMember (
    CustNo INT PRIMARY KEY AUTO_INCREMENT,
    CustName VARCHAR(30) NOT NULL,
    Phone VARCHAR(13) UNIQUE,
    Address VARCHAR(50),
    JoinDate DATE NOT NULL,
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C')),
    City CHAR(2)
);

CREATE TABLE Sale (
    SaleNo INT PRIMARY KEY AUTO_INCREMENT,
    CustNo INT,
    PCost INT,
    Amount INT,
    Price INT,
    PCode CHAR(3),
    FOREIGN KEY (CustNo) REFERENCES ShoMember(CustNo)
);

--1. 회원등록

insert into ShopMember (CustName, Phone, Address, JoinDate, Grade, City)
values
('홍길동', '010-1234-5678', '서울시 강남구', '2020-01-01', 'A', '01’),
('이순신', '010-2222-3333', '부산시 해운대구', '2021-03-15', 'B', '02’),
('강감찬', '010-7777-8888', '대구시 달서구', '2019-05-20', 'C', '03')

-- 2. 회원조회

-- 1) 고객등급이 A등급인 회원의 이름, 전화번호, 가입일자를 조회.

select CustName, Phone, JoinDate from ShopMember where Grade = 'A';

-- 2) 가입일자가 2020년 이후인 회원을 조회하시오.

select * from ShopMember where JoinDate >= 2020

-- 3. 판매등록

insert into Sale (CustNo, PCost, Amount, Price, PCode)
values
(1, 1000, 10, 10000, 'P01’),
(2, 2000, 5, 10000, 'P02’),
(3, 1500, 7, 10500, 'P03')

-- 4. 판매조회

-- 1) 회원별 총 구매금액을 구하시오. (출력: 회원번호, 회원성명, 총금액)

SELECT 
    s.CustNo, 
    m.CustName, 
    SUM(s.Price) AS TotalAmount
FROM 
    ShopMember AS m
    INNER JOIN Sale AS s ON m.CustNo = s.CustNo
GROUP BY 
    s.CustNo, m.CustName;

-- 2) 가장 구매금액이 높은 회원의 이름과 금액을 조회하시오.

SELECT 
    m.CustName, 
    SUM(s.Price) AS TotalAmount
FROM 
    ShopMember AS m
    INNER JOIN Sale AS s ON m.CustNo = s.CustNo
GROUP BY 
    m.CustNo, m.CustName
ORDER BY 
    TotalAmount DESC
LIMIT 1;

-- 데이터 수정 / 삭제
-- 1) '이순신' 회원의 등급을 A로 수정하시오.
update ShopMember set Grade = 'A' where CustName = '이순신'

-- 2) CustNo = 3인 회원을 삭제하시오.
DELETE FROM ShopMember WHERE CustNo = 3;
DELETE FROM Sale WHERE CustNo = 3;



