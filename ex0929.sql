SHOW DATABASES;
USE exdb;

SHOW TABLES;
SELECT * FROM persons;
DROP TABLE persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age int
)

DESCRIBE Persons;

ALTER TABLE Persons
MODIFY Age INT NOT NULL;
DESC Persons;

DROP TABLE Persons;
SELECT * FROM Persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT,
	UNIQUE(ID)
)

DROP TABLE Persons;
SELECT * FROM Persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT
)
DESC TABLE Persons;

ALTER TABLE Person
ADD CONSTRAINT uc_Person UNIQUE(ID, LastName);


SHOW INDEX FROM Persons;

SELECT * FROM information_schema.TABLE_CONSTRINTS
WHERE TABLE_NAME = 'Persons';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';

SELECT CONSTRAINT_NAME, COLUMN_NAME, CRDINAL_POSITION
FROM information_schema.key_column_usage
WHERE TABLE_NAME = 'Persons'
	AND CONSTRAINT_NAME = 'UC_Person';
	

DROP TABLE Persons;

SELECT * FROM Persons;

CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT,
	CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);
DESC Persons;

ALTER TABLE Persons
ADD PRIMARY KEY(ID);


ALTER TABLE persons
DROP PRIMARY KEY;

CREATE TABLE Persons_f(
	PersonID INT PRIMARY KEY,
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	Age INT
);

SELECT * FROM Persons_F;

CREATE TABLE orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY(OrderID),
	FOREIGN KEY(PersonID) REFERENCES persons_F(PersonID)
);

SELECT * FROM orders_F;
DESC Persons_F;
DESC orders_F;

CREATE TABLE orders_F(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY(OrderID),
	CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES persons_f(person)
);

DROP TABLE orders_f;
CREATE TABLE orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT
);
DESC orders_f;

ALTER TABLE orders_f
ADD FOREIGN KEY(PersonId)

SHOW INDEX FROM orders_f;


ALTER TABLE orders_f
DROP FOREIGN KEY fk_PersonOrder;


CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	CHECK(Age>=18)
);

DROP TABLE persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	City VARCHAR(255),
	CONSTRAINT CHK_Person CHECK (age >=18 AND City = 'Sandnes')
)

SHOW INDEX FROM persons;

ALTER TABLE persons
ADD CHECK(Age>=18);

ALTER TABLE persons
ADD CHECK(Age>=18 AND City = 'Sandnes') ;

ALTER TABLE persons
DROP CHECK CHK_PersonAge;

DROP TABLE persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT
);

ALTER TABLE persons 
ADD CHECK (Age >= 18);

SELECT * FROM information_schema.TABLE_CONSTRAINTS;

ALTER TABLE persons 
ADD CONSTRAINT chk_personAge CHECK (Age >= 18 AND City = 'Sandnes');

ALTER TABLE persons
DROP CONSTRAINT chk_personAge;

