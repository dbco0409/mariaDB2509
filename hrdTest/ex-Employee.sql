CREATE TABLE Employee (
    EmpNo INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(30) NOT NULL,
    Dept VARCHAR(20) NOT NULL,
    HireDate DATE NOT NULL,
    Salary INT,
    CHECK (Salary >= 2000000),
    UNIQUE (EmpName)
);

-- 2. sql문을 작성하시오.

-- 1) 사원등록

INSERT INTO Employee (EmpName, Dept, HireDate, Salary)
VALUES 
('홍길동', '영업부', '2020-03-01', 2500000),
('이순신', '인사부', '2019-07-15', 3200000),
('강감찬', '개발부', '2021-01-10', 2800000)

--2)조회
--1. 부서가 개발부인 사원의 사번, 이름, 급여를 조회하시오.

select EmpNo, EmpName, Salary from Employee where Dept = '개발부';

--2. 급여가 3000000원 이상인 사원의 이름과 부서를 조회하시오.

select EmpName, Dept from Employee where Salary >= 3000000;


--3.수정
UPDATE Employee SET Salary = 3500000 WHERE EmpName = '이순신';

--4.삭제

delete from Employee where EmpNo = 1;









