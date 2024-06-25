CREATE DATABASE SchoolDb

USE SchoolDb

CREATE TABLE Groups
(
Id INT NOT NULL UNIQUE IDENTITY,
Name VARCHAR(50) NOT NULL
)


CREATE TABLE Teachers
(
Id INT NOT NULL UNIQUE IDENTITY,
FullName VARCHAR(150) NOT NULL,
Salary INT CHECK (Salary >= 500 and Salary <= 10000),
GroupId INT FOREIGN KEY REFERENCES Groups(Id)
)

CREATE TABLE Students
(
Id INT NOT NULL UNIQUE IDENTITY,
FullName VARCHAR(150) NOT NULL,
Grade INT CHECK (Grade >= 0 and Grade <= 100)
)

ALTER TABLE Students
ADD TeachersId INT FOREIGN KEY REFERENCES Teachers(Id)

INSERT INTO Groups
VALUES('PB201'),
('P200')

INSERT INTO Groups
VALUES
('PA100'),
('PB102')


SELECT * FROM Groups

INSERT INTO Teachers
VALUES
('Yusif Quluzade', 2500, 1),
('Beyler Sadiqov', 1000, 3)

SELECT * FROM Teachers


INSERT INTO Students
VALUES
('Abbas Bayramli', 80),
('Huseyn Ceferli', 90),
('Ilaha Hasanova', 94),
('Raul Eliyev', 75)

UPDATE Students
SET TeachersId = 1
WHERE Students.Id = 1

UPDATE Students
SET TeachersId = 1
WHERE Students.Id = 2

UPDATE Students
SET TeachersId = 2
WHERE Students.Id = 3

UPDATE Students
SET TeachersId = 2
WHERE Students.Id = 4

SELECT * FROM Students


SELECT S.Id, S.FullName AS 'StudentFullName',G.Name AS 'StudentGroup' ,T.FullName AS 'StudentTeacherFullName'  , S.Grade AS 'Grade' FROM Students AS S
LEFT JOIN Teachers as T
ON S.TeachersId = T.Id
INNER JOIN Groups as G
ON T.GroupId = G.Id