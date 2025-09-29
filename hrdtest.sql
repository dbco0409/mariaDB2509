CREATE DATABASE bookstore

USE bookstore;

CREATE TABLE Book(
	BookID INT PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	Author VARCHAR(50),
	Publisher VARCHAR(50),
	Price INT,
	PubYear INT 
	CHECK (Price > 0)
);


SHOW TABLES;

SELECT * FROM book;
INSERT INTO book (BookID, Title, Author, Publisher, Price, PubYear) VALUES
(1, '햇빛 아래서', '김철수', '푸른책', 15000, 2018),
(2, '달빛 속 이야기', '이영희', '열림출판사', 18000, 2020),
(3, '마법의 숲', '박민준', '꿈틀북스', 22000, 2019),
(4, '바람의 노래', '최수진', '푸른책', 17000, 2021),
(5, '하늘과 바다', '정하늘', '열림출판사', 25000, 2017),
(6, '시간 여행자', '오세훈', '미래북스', 20000, 2022),
(7, '비밀의 정원', '윤지영', '꿈틀북스', 16000, 2016),
(8, '모험의 시작', '한지훈', '푸른책', 21000, 2021),
(9, '마음의 지도', '김민지', '열림출판사', 19000, 2020),
(10, '어둠 속 빛', '이준호', '미래북스', 23000, 2019);


DROP table member;

CREATE TABLE Members(
	MemberID int PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Phone VARCHAR(50),
	Address VARCHAR(255)
);

SHOW TABLES;

INSERT INTO members (MemberID, Name, Phone, Address) VALUES
(1, '홍길동', '010-1234-5678', '서울특별시 종로구 세종로 1'),
(2, '김철수', '010-2345-6789', '서울특별시 강남구 테헤란로 20'),
(3, '이영희', '010-3456-7890', '경기도 성남시 분당구 정자동 45'),
(4, '박민준', '010-4567-8901', '인천광역시 연수구 송도동 12'),
(5, '최수진', '010-5678-9012', '대전광역시 유성구 덕명동 3'),
(6, '정하늘', '010-6789-0123', '부산광역시 해운대구 우동 88'),
(7, '오세훈', '010-7890-1234', '경기도 고양시 일산동구 장항동 50'),
(8, '윤지영', '010-8901-2345', '서울특별시 마포구 합정동 7'),
(9, '한지훈', '010-9012-3456', '경기도 수원시 권선구 권선동 33'),
(10, '김민지', '010-0123-4567', '대구광역시 수성구 범어동 21');


CREATE TABLE Rental(
	RentalID INT PRIMARY KEY,
	MemberID INT,
	BookID INT,
	RentDate DATE,
	ReturnDate DATE,
	FOREIGN KEY (MemberID) REFERENCES members(MemberID),
	FOREIGN KEY (BookID) REFERENCES book(BookID)
);

INSERT INTO Rental (RentalID, MemberID, BookID, RentDate, ReturnDate) VALUES
(1, 1, 3, '2025-09-01', '2025-09-10'),
(2, 2, 1, '2025-09-02', '2025-09-12'),
(3, 3, 5, '2025-09-03', '2025-09-15'),
(4, 4, 2, '2025-09-04', '2025-09-14'),
(5, 5, 4, '2025-09-05', '2025-09-16'),
(6, 6, 6, '2025-09-06', '2025-09-18'),
(7, 7, 7, '2025-09-07', '2025-09-20'),
(8, 8, 8, '2025-09-08', '2025-09-21'),
(9, 9, 9, '2025-09-09', '2025-09-22'),
(10, 10, 10, '2025-09-10', '2025-09-23');



SELECT * FROM book WHERE PubYear >= 2020 -- 2020년 이후 춢판된 도서

SELECT * FROM book AS b INNER JOIN Rental AS r ON b.BookID = r.BookID WHERE b.BookID = 1;
-- 홍길동 회원이 대출한 도서 목록members

SELECT * FROM book AS b INNER JOIN Rental AS r ON b.BookID = r.BookID WHERE rentDate != '' AND ReturnDate = '';
-- 반납하지 않은 도서를 검색하시오.


SELECT 
    b.Title, COUNT(r.RentalID) AS RentCount
FROM Book AS b
LEFT JOIN Rental AS r ON b.BookID = r.BookID
GROUP BY b.Title;
--- 도서별 대출횏수


SELECT MAX(price), Title FROM book
---- 가장 비싼 도서
