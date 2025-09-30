create table Artist (
	ArtistNo int primary key auto_increment,
	ArtistName varchar(30) not null unique,
	DebutDate date not null,
	Genre varchar(20) not null,
	Agency varchar(30)	
);
create table Album (
	AlbumNo int primary key AUTO_INCREMENT,
	ArtistNo int 
	AlbumTitle varchar(50) not null, 
	ReleaseDate date not null,
	Sales int CHECK (Sales >= 0),
	FOREIGN KEY (ArtistNo) REFERENCES Artist(ArtistNo)
);

-- 아티스트 등록

insert into Artist (ArtistName, DebutDate, Genre, Agency) 
VAELUS
('아이유', '2008-09-18', '발라드', 'EDAM엔터테인먼트’),
('BTS', '2013-06-13', 'K-POP', '하이브’),
('블랙핑크', '2016-08-08', 'K-POP', 'YG엔터테인먼트')

insert into Album (ArtistNo, AlbumTitle, ReleaseDate, Sales) 
VAELUS
(1, '좋은 날', '2010-12-09', 500000),
(2, 'MAP OF THE SOUL: 7', '2020-02-21', 4300000),
(3, 'THE ALBUM', '2020-10-02', 1300000)


--2. 조회
-- 1) 장르가 'K-POP'인 아티스트의 이름과 소속사를 조회.

select ArtistName, Agency from Artist where Genre = 'KPOP'

-- 2) 판매량이 1,000,000이상인 앨범의 제목과 판매량을 조회.

select AlbumTitle, Sales from Album where Sales >= 1000000

-- 3) 아티스트별 총 판매량을 구하시오.
(출력: 아티스트명, 총 판매량)

SELECT a.ArtistName, SUM(b.Sales)
FROM Artist AS a
INNER JOIN Album AS b ON a.ArtistNo = b.ArtistNo
GROUP BY a.ArtistName;


-- 4. 수정
-- 아이유의 소속사를 카카오엔터테인먼트로 수정하시오.
update Artist set Agency = '카카오엔터테인먼트' where ArtistName = '아이유'

-- 5. 삭제
-- AlbumNo = 1인 앨범을 삭제하시오.
DELETE FROM Album WHERE AlbumNo = 1;


-- 확장문제
-- 1. 소속사별 매출현황

SELECT 
    a.Agency, 
    COUNT(DISTINCT a.ArtistNo) AS ArtistCount,
    SUM(b.Sales) AS TotalSales
FROM 
    Artist AS a
    INNER JOIN Album AS b ON a.ArtistNo = b.ArtistNo
GROUP BY 
    a.Agency;








