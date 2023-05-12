CREATE TABLE marks(
    stuid INT AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    major VARCHAR(20) DEFAULT 'unknown',
    gpa DECIMAL(3,2),
    PRIMARY KEY(stuid)
);

DESCRIBE TABLE marks;
DROP TABLE marks;
SELECT * FROM marks; 

INSERT INTO marks (name,major,gpa) VALUES('git','geography',7.59);
INSERT INTO marks (name,major,gpa) VALUES('rimed','economics',6.59);
INSERT INTO marks (name,major,gpa) VALUES('yung','computers',8.95);
INSERT INTO marks (name, major,gpa) VALUES('nithin','data',7.51);
INSERT INTO marks (name,major,gpa) VALUES ('ravi','mechanical',9.32);
INSERT INTO marks (name,major,gpa) VALUES ('ram','physics',7.8);

SELECT * FROM marks ORDER BY gpa DESC,stuid ;
SELECT * FROM marks LIMIT 3;
SELECT * FROM marks ORDER BY gpa DESC LIMIT 3;
/*filtering*/
SELECT * FROM marks WHERE major = 'physics';
SELECT marks.name FROM marks WHERE major='economics' OR major='computers';
--{<,>,<=,>=,=,<>(not equal to),AND,OR}
SELECT * FROM marks WHERE major IN ('physics','data');
