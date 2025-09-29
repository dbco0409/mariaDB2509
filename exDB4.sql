SET @myVar1 = 3;
PREPARE myQuery
	FROM 'select Name, height from usertbl order by height limit ?';
EXECUTE myQuery USING @myVar1;

USE sqlDB;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;

