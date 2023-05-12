--find all employees
SELECT * FROM employee;
--find all clients
SELECT * FROM client;
--order by salary
SELECT * FROM employee
ORDER BY salary DESC;
--order by sex then NAME
SELECT * FROM employee
ORDER BY sex,firstname,lastname; 
--find first five employees in the TABLE
SELECT * FROM employee
LIMIT 5;
--firstnames and lastnames of employees
SELECT firstname,lastname from employee;
--find the forename and surname of all employees(using AS)
SELECT firstname AS forename ,lastname AS surname FROM employee;
--find out all different genders(using DISTINCT)
SELECT DISTINCT sex FROM employee;


--fuctions
--find the number of employees(using count)
SELECT COUNT(empid /*{ * | [ DISTINCT | ALL ] EXPR}*/)
FROM employee;
SELECT COUNT(superid /*{ * | [ DISTINCT | ALL ] EXPR}*/)
FROM employee;
--number of female employees forn after 1970
SELECT COUNT(empid /*{ * | [ DISTINCT | ALL ] EXPR}*/)
FROM employee WHERE sex='f' AND birthday>'1970-01-01';
--average of male emp salary(using AVG)
SELECT AVG(salary /*[ DISTINCT | ALL ] EXPR*/)
FROM employee where sex='m';
--sum of salary(using SUM)
SELECT SUM(salary /*[ DISTINCT | ALL ] EXPR*/)
FROM employee;
--find out howman males and females are there(using group by)
SELECT COUNT(sex /*{ * | [ DISTINCT | ALL ] EXPR}*/), sex 
FROM employee GROUP BY(sex);
--how much each employee sold
SELECT SUM(totalsales /*[ DISTINCT | ALL ] EXPR*/),empid
FROM workswith GROUP BY(empid);


--wildcards=={%=any no. of charecters,_=one charecter}
--find any client who are an LLC(using LIKE)
SELECT * FROM client  
where clientname LIKE '%LLC';
--find any branch supplier who are in  lable business
SELECT * FROM branchsupplier
WHERE suppliername LIKE '% Lable%';
--find any employee who was born in october
SELECT * FROM employee
WHERE birthday LIKE '____-02%';
--find any clients who are schools
SELECT * FROM client 
WHERE clientname LIKE '%school%';


--unions (combind the results of multiple select statements into one)
--find a list of employee and branch names (using UNION)
SELECT firstname AS company_names FROM employee UNION
SELECT branchname FROM branch UNION
SELECT clientname FROM client;
/*rules=have to collect same number of columns from both STATEMENT
=heve to collect same data typed data from both statements*/
--find a list of all clients and suppliers names
SELECT clientname,client.branchid
FROM client UNION
SELECT suppliername,branchsupplier.branchid FROM branchsupplier;
--find a list of all the money spent or earned by the company
SELECT salary FROM employee UNION
SELECT totalsales FROM workswith;


--join
--using inner join
INSERT INTO branch VALUES (4,'buffalo',NULL,NULL);
SELECT employee.empid,employee.firstname,branch.branchname
FROM employee JOIN branch
ON employee.empid=branch.mgrid;
--left JOIN(gives all the names from left table too(employee))
--right JOIN(gives all the names from right table too(branch))

