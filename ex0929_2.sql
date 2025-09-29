USE sqlDB;
SET @myVar1 = 5;
SET @myVar2 = 3; 
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름 ==> ';

SELECT @myVar1;
SELECT @myVar2+@myVar3;
SELECT @myVar4, NAME FROM userTBL WHERE height > 180;

SET @myVar1 = 3;
PREPARE myQuery FROM 'select Name, height from userTBL order by height limit ?';
EXECUTE myQuery USING @myVar1;


USE sqlDB;
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTBL;

SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buyTBL;
-- 또는
SELECT CONVERT(AVG(amount), SIGNED INTEGER) AS '평균구매개수' FROM buyTBL;

SELECT CAST('2022$12$12' AS DATE);
