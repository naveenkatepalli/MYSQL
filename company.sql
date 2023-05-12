CREATE TABLE employee(
    empid INT PRIMARY KEY,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    birthday DATE,
    sex VARCHAR(1),
    salary INT,
    superid INT,
    branchid INT
);

CREATE TABLE branch (
    branchid INT PRIMARY KEY,
    branchname VARCHAR(40),
    mgrid INT,
    mgrstartdate DATE,
    FOREIGN KEY(mgrid) REFERENCES employee (empid) ON DELETE SET NULL
);

ALTER TABLE employee ADD FOREIGN KEY(branchid) REFERENCES BRANCH(branchid) ON DELETE SET NULL;
ALTER TABLE employee ADD FOREIGN KEY(superid) REFERENCES employee(empid) ON DELETE SET NULL;


CREATE TABLE client (
    clientid INT PRIMARY KEY,
    clientname VARCHAR(40),
    branchid INT,
    FOREIGN KEY(branchid) REFERENCES branch(branchid) ON DELETE SET NULL
);

CREATE TABLE workswith (
    empid INT,
    clientid INT,
    totalsales INT,
    PRIMARY key(empid, clientid),
    FOREIGN KEY(empid) REFERENCES employee(empid) ON DELETE CASCADE,
    FOREIGN KEY(clientid) REFERENCES client(clientid) ON DELETE CASCADE
);

CREATE TABLE branchsupplier (
    branchid INT,
    suppliername VARCHAR(40),
    supplytype VARCHAR(40),
    PRIMARY KEY(branchid, suppliername),
    FOREIGN KEY(branchid) REFERENCES branch (branchid) ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(
    100,
    'David',
    'Wallace',
    '1967-11-17',
    'M',
    250000,
    NULL,
    NULL
);

INSERT INTO branch VALUES(
    1,
    'Corporate',
    100,
    '2006-02-09'
);

UPDATE employee
SET branchid = 1
WHERE empid = 100;

INSERT INTO employee VALUES(
    101,
    'Jan',
    'Levinson',
    '1961-05-11',
    'F',
    110000,
    100,
    1
);

-- Scranton
INSERT INTO employee VALUES(
    102,
    'Michael',
    'Scott',
    '1964-03-15',
    'M',
    75000,
    100,
    NULL
);

INSERT INTO branch VALUES(
    2,
    'Scranton',
    102,
    '1992-04-06'
);

UPDATE employee
SET branchid = 2
WHERE
    empid = 102;

INSERT INTO employee VALUES(
    103,
    'Angela',
    'Martin',
    '1971-06-25',
    'F',
    63000,
    102,
    2
);

INSERT INTO employee VALUES(
    104,
    'Kelly',
    'Kapoor',
    '1980-02-05',
    'F',
    55000,
    102,
    2
);

INSERT INTO employee VALUES(
    105,
    'Stanley',
    'Hudson',
    '1958-02-19',
    'M',
    69000,
    102,
    2
);

-- Stamford
INSERT INTO employee VALUES(
    106,
    'Josh',
    'Porter',
    '1969-09-05',
    'M',
    78000,
    100,
    NULL
);

INSERT INTO branch VALUES(
    3,
    'Stamford',
    106,
    '1998-02-13'
);

UPDATE employee
SET branchid = 3
WHERE empid = 106;

INSERT INTO employee VALUES(
    107,
    'Andy',
    'Bernard',
    '1973-07-22',
    'M',
    65000,
    106,
    3
);

INSERT INTO employee VALUES(
    108,
    'Jim',
    'Halpert',
    '1978-10-01',
    'M',
    71000,
    106,
    3
);

-- BRANCH SUPPLIER
INSERT INTO branchsupplier VALUES(
    2,
    'Hammer Mill',
    'Paper'
);

INSERT INTO branchsupplier VALUES(
    2,
    'Uni-ball',
    'Writing Utensils'
);

INSERT INTO branchsupplier VALUES(
    3,
    'Patriot Paper',
    'Paper'
);

INSERT INTO branchsupplier VALUES(
    2,
    'J.T. Forms & Labels',
    'Custom Forms'
);

INSERT INTO branchsupplier VALUES(
    3,
    'Uni-ball',
    'Writing Utensils'
);

INSERT INTO branchsupplier VALUES(
    3,
    'Hammer Mill',
    'Paper'
);

INSERT INTO branchsupplier VALUES(
    3,
    'Stamford Lables',
    'Custom Forms'
);

-- CLIENT
INSERT INTO client VALUES(
    400,
    'Dunmore Highschool',
    2
);

INSERT INTO client VALUES(
    401,
    'Lackawana Country',
    2
);

INSERT INTO client VALUES(
    402,
    'FedEx',
    3
);

INSERT INTO client VALUES(
    403,
    'John Daly Law, LLC',
    3
);

INSERT INTO client VALUES(
    404,
    'Scranton Whitepages',
    2
);

INSERT INTO client VALUES(
    405,
    'Times Newspaper',
    3
);

INSERT INTO client VALUES(
    406,
    'FedEx',
    2
);

-- WORKS_WITH
INSERT INTO workswith VALUES(
    105,
    400,
    55000
);

INSERT INTO workswith VALUES(
    102,
    401,
    267000
);

INSERT INTO workswith VALUES(
    108,
    402,
    22500
);

INSERT INTO workswith VALUES(
    107,
    403,
    5000
);

INSERT INTO workswith VALUES(
    108,
    403,
    12000
);

INSERT INTO workswith VALUES(
    105,
    404,
    33000
);

INSERT INTO workswith VALUES(
    107,
    405,
    26000
);

INSERT INTO workswith VALUES(
    102,
    406,
    15000
);

INSERT INTO workswith VALUES(
    105,
    406,
    130000
);