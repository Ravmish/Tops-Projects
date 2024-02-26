CREATE DATABASE SCHOOL;
USE SCHOOL;
CREATE TABLE STUDENT(
STDID INT PRIMARY KEY,
STDNAME VARCHAR(50),
SEX VARCHAR(50),
PERCENTAGE INT ,
CLASS INT,
SEC VARCHAR(2),
STREAM_ VARCHAR(50),
DOB DATE
);
INSERT INTO STUDENT VALUES(1001, 'SUREKHA JOSHI', 'FEMALE', 82, 12, 'A', 'SCIENCE', '1998-3-8');
INSERT INTO STUDENT VALUES(1002, 'MAAHI AGARWAL', 'FEMALE', 56, 11, 'C', 'COMMERCE', '2008-11-23');
INSERT INTO STUDENT VALUES(1003, 'SANAM VERMA', 'MALE', 59, 11, 'C', 'COMMERCE', '2006-6-29');
INSERT INTO STUDENT VALUES(1004, 'RONIT KUMAR', 'MALE', 63, 11, 'C', 'COMMERCE', '1997-5-11');
INSERT INTO STUDENT VALUES(1005, 'DIPESH PULKIT', 'MALE', 78, 11, 'B', 'SCIENCE', '2003-9-14');
INSERT INTO STUDENT VALUES(1006, 'JAHANVI PURI', 'FEMALE', 60, 11, 'B', 'COMMERCE', '2008-7-11');
INSERT INTO STUDENT VALUES(1007, 'SANAM KUMAR', 'MALE', 23, 12, 'F', 'COMMERCE', '1998-3-8');
INSERT INTO STUDENT VALUES(1008, 'SAHIL SARAS', 'MALE', 56, 11, 'C', 'COMMERCE', '2008-7-11');
INSERT INTO STUDENT VALUES(1009, 'AKSHRA AGARWAL', 'FEMALE', 72, 12, 'B', 'COMMERCE', '1996-1-10');
INSERT INTO STUDENT VALUES(1010, 'STUTI MISHRA', 'FEMALE', 39, 11, 'F', 'SCIENCE', '2008-11-23');
INSERT INTO STUDENT VALUES(1011, 'HARSH AGARWAL', 'MALE', 42, 11, 'C', 'SCIENCE', '1998-3-8');
INSERT INTO STUDENT VALUES(1012, 'NIKUNJ AGARWAL', 'MALE', 49, 12, 'C', 'COMMERCE', '1998-6-28');
INSERT INTO STUDENT VALUES(1013, 'AKRITI SAXENA', 'FEMALE', 89, 12, 'A', 'SCIENCE', '2008-11-23');
INSERT INTO STUDENT VALUES(1014, 'TANI RASTOGI', 'FEMALE', 82, 12, 'A', 'SCIENCE', '2008-11-23');

--  To display all the records form STUDENT table.
SELECT * FROM student ;

-- To display any name and date of birth from the table STUDENT
SELECT StdName, DOB FROM student ; 

--  To display all students record where percentage is greater of equal to 80 FROM student table
SELECT * FROM student WHERE percentage >= 80; 

-- To display student name, stream and percentage where percentage of student is more than 80
SELECT STDNAME, STREAM_, PERCENTAGE FROM STUDENT WHERE PERCENTAGE > 80;

-- To display all records of science students whose percentage is more than 75 form student table
SELECT * FROM STUDENT WHERE STREAM_ = 'SCIENCE' AND PERCENTAGE > 75; 