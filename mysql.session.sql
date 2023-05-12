CREATE TABLE student(
    stu_id INT,
    name VARCHAR(30) NOT NULL,
    major VARCHAR(30) DEFAULT 'unknown',
    PRIMARY KEY (stu_id)
);
DESCRIBE student
DROP TABLE student
ALTER TABLE student ADD gpa DECIMAL(3,2) UNIQUE;
ALTER TABLE student DROP gpa;

SELECT * FROM student;
INSERT INTO student VALUES(1,'JACK','CSE',7.51);
INSERT INTO student VALUES(2,'ryan','biology',8.76);
INSERT INTO student (stu_id,name,gpa) VALUES(3,'ROME',6.61);
INSERT INTO student VALUES(4,'HAM','MATHS','8.0');

CREATE DATABASE abc;
USE abc;
DROP DATABASE abc;

UPDATE student
SET major = 'bio'
WHERE major = 'biology';

UPDATE STUDENT
SET MAJOR = 'EEE'
WHERE stu_id = 3;

SELECT * FROM STUDENT;

UPDATE student
SET major = 'engineering'
WHERE major='CSE' OR major='EEE'

UPDATE student
SET name='kevin',major='unknown'
WHERE name='ROME'

DELETE FROM student
WHERE stu_id=4;

DELETE FROM STUDENT
WHERE name='kevin' AND major='unknown';

DELETE FROM student;

CREATE DATABASE company_database;