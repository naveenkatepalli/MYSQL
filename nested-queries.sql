--FIND THE NAMES OF ALL employees who have sold over 30,000 to a single client
SELECT employee.firstname,employee.lastname FROM employee 
WHERE empid IN (SELECT workswith.empid FROM workswith WHERE workswith.totalsales>30000);
--usage of ("IN")


/* find all cliens who are handeled by the branch that michael scott 
manages assume you know michael's id*/
SELECT client.clientname FROM client WHERE branchid IN
(SELECT branch.branchid FROM branch WHERE branch.mgrid IN
(SELECT empid FROM employee WHERE firstname='Michael' AND lastname='Scott'));


/*in foreign key "on delete set null" converts all values of deleted row to NULL
where as "on delete cascade" deletes all rows with the deleted values as foreign key*/

--triggers 
CREATE TABLE triggertest(
    message VARCHAR(100)
);

--have to create a trigger in command prompt because of delimiter
DELIMITER $$
CREATE TRIGGER mytrigger BEFORE INSERT ON employee FOR EACH ROW BEGIN 
INSERT INTO triggertest VALUES('added new employee');
END $$
DELIMITER ;

INSERT INTO employee VALUES(109,'oscar','mart','1991-12-15','m',69000,106,3);
SELECT* FROM triggertest;

--setting trigger to access the attributes of data that is inserted
DELIMITER $$
CREATE TRIGGER mytriggers BEFORE INSERT ON employee FOR EACH ROW BEGIN 
INSERT INTO triggertest VALUES(NEW.firstname);
END$$
DELIMITER ;

INSERT into employee VALUES(115,'yong','rgrs','2002-03-23','m',530000,102,1);
--WE CAN CREATE triggers for "updates,deletes,alters,drops"
--we can create triggers for "after"
DELIMITER $$
drop TRIGGER mytrigger;
CREATE TRIGGER MYTRIGGERSSS BEFORE
    INSERT ON EMPLOYEE FOR EACH ROW
BEGIN
    IF NEW.SEX='m' THEN
        INSERT INTO TRIGGERTEST VALUES(
            'ENDERED A MALE'
        );

        ELSEIF NEW.SEX='f' THEN
            INSERT INTO TRIGGERTEST VALUES(
                'ENTERED A FEMALE'
            );
        ELSE
            INSERT INTO TRIGGERTEST VALUES(
                'ENTERED OTHERS'
            );
        END IF;
        END$$
DELIMITER ;