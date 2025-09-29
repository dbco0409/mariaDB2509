SELECT userID, NAME FROM usertbl WHERE birthYear >= 1970 AND height >= 182;

SELECT userID, NAME FROM userTbl WHERE birthYear >= 1970 OR height >= 182;

SELECT NAME, height FROM userTbl WHERE height >= 180 AND HEIGHT <= 183;

SELECT NAME, height FROM userTbl WHERE height BETWEEN 180 AND 183;

USE EMPLOYEES;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 5;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 0,5;

USE SQLDB;
CREATE TABLE buyTb12 (SELECT * FROM buyTbl);
SELECT * FROM buytb12;

SELECT NAME, MAX(height), MIN(height) FROM userTbl;

SELECT NAME, MAX(height), MIN(height) FROM userTbl GROUP BY NAME;

SELECT NAME, height FROM userTbl WHERE height = (SELECT MAX(height) FROM userTbl) OR height (SELECT MIN(height) FROM userTbl);

SELECT COUNT(*) FROM userTbl;

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM userTbl;

USE sqlDB;
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
FROM buyTbl GROUP BY userID;

SELECT * userID AS '사용자', SUM(price*amount) AS '총구매액'
FROM buyTbl WHERE SUM(price*amount) > 1000
GROUP BY userID; 

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액' FROM buytbl GROUP BY userID HAVING SUM(price*amount) > 1000;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액' FROM buyTbl GROUP BY userID HAVING SUM(price*amount) > 1000
ORDER BY SUM(price*amount);

SELECT num, groupName, SUM(price*amount) AS '비용' FROM buyTbl GROUP BY groupName, num WITH ROLLUP;



USE sqlDB; 
CREATE TABLE testTBL1 (id INT, useName CHAR(3), age INT);
INSERT INTO testTBL1 VALUES (1, '홍길동', 25);

INSERT INTO testTBL1(id, userName) VALUES(2, '설현');

INSERT INTO testTBL1(userName, age, id) VALUES('초아', 26, 2);


USE sqlDB;
CREATE TABLE testTBL2 (id INT AUTO_INCREMENT PRIMARY KEY, userName CHAR(3), age INT);
INSERT INTO testTBL2 VALUES (NULL, '지민', 25);
INSERT INTO testTBL2 VALUE (NULL, '유나', 22);
INSERT INTO testTBL2 VALUES (NULL, '유경', 21);

SELECT * FROM testTBL2;

ALTER TABLE testTBL2 AUTO_INCREMENT = 100;
INSERT INTO testTBL2 VALUES (NULL, '찬미', 23);
SELECT * FROM testTBL2;

USE sqlDB;
CREATE TABLE testTBL3 (id INT AUTO_INCREMENT PRIMARY KEY, userName CHAR(3), age INT);

ALTER @@auto_increment_increment=3;
INSERT INTO testTBL3 VALUES (NULL, '나연', 20);
INSERT INTO testTBL3 VALUES (NULL, '정연', 18);
INSERT INTO testTBL3 VALUES (NULL, '모모', 19);

SELECT * FROM testTBL3; 


USE sqoDB;
CREATE TABLE testTBL4 (id INT, fname VARCHAR(50), Lname VARCHAR(50));
INSERT INTO testTBL4
SELECT emp_no, first_name, LAST_name FROM employees.employees;

USE sqlDB;
CREATE TABLE testTBL5
(SELECT emp_no, first_name, last_name FROM employees.employees);

UPDATE testTBL4 SET LnAME = '없음' WHERE Fname = "kyoichi";

use sqlDB;
update buyTBL2 set price = price*1.5;

delete from buyTBL2 where Fname  = 'Aamar';


DELETE FROM testTBL4 WHERE Fname = "Mary" LIMIT 5;

USE sqlDB;
CREATE TABLE bigTBL1 (SELECT * FROM employees.employees);
CREATE TABLE bigTBL2 (SELECT * FROM employees.employees);
CREATE TABLE bigTBL3 (SELECT * FROM employees.employees);

DELETE FROM bigTBL1;
DROP TABLE bigTBL2;
TRUNCATE TABLE BIGtbl3;

USE sqlDB;
CREATE TABLE membertbl (SELECT userID, NAME, addr FROM userTbl LIMIT 3);
ALTER TABLE membertbl 
ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
SELECT * FROM membertbl;

INSERT INTO membertbl VALUES('BBK', '비비코', '미국')
ON DUPLICATE KEY UPDATE NAME = '비비코', addr = '미국';

INSERT INTO membertbl VALUES('DJM', '동짜몽', '일본')
ON DUPLICATE KEY UPDATE NAME = '동짜몽', addr = '일본'

USE sqlDB;

SELECT userid AS '사용자', SUM(price*amount) AS '총구매액' FROM buyTBL GROUP BY userid;

SELECT * FROM abc ORDER BY 총구매액 DESC
wit abc(userid, total) AS (SELECT userid, SUM(price*amount) FROM buyTBL GROUP BY userid ) 
SELECT * FROM abc ORDER BY total DESC;

SELECT addr, MAX(height) FROM userTBL GROUP BY addr
WITH cte_userTBL(addr, maxHeight) AS (SELECT addr, MAX(height) FROM userTBL GROUP BY addr)

SELECT AVG(키) FROM cte_테이블이름
WITH cte_userTBL (addr, maxHeight) AS (SELECT addr, MAX(height) FROM userTBL GROUP BY addr)
SELECT AVG(maxHeight(1.0) AS '각 지역별 최고키의 평균' FROM cte_userTBL;


SELECT CASE('2020-10-19 12:35:29.123' AS DATE) AS 'DATE';
SELECT CASE('2020-10-19 12:35:29.123' AS TIME) AS 'TIME';
SELECT CASE('2020-10-19 12:35:29.123' AS DATETIME) AS 'DATETIME';



