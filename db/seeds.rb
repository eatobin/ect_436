# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

connection = ActiveRecord::Base.connection();

connection.execute("INSERT INTO departments (DEPTNO, DNAME, LOC, CREATED_AT, UPDATED_AT) VALUES
(10, 'ACCOUNTING', 'NEW YORK', localtimestamp, localtimestamp),
(20, 'RESEARCH', 'DALLAS', localtimestamp, localtimestamp),
(30, 'SALES', 'CHICAGO', localtimestamp, localtimestamp),
(40, 'OPERATIONS', 'BOSTON', localtimestamp, localtimestamp);")

connection.execute("INSERT INTO employees (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, CREATED_AT, UPDATED_AT) VALUES
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', '5000.00', '0.00', 10, localtimestamp, localtimestamp),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', '2850.00', '0.00', 30, localtimestamp, localtimestamp),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', '2450.00', '0.00', 10, localtimestamp, localtimestamp),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', '2975.00', '0.00', 20, localtimestamp, localtimestamp),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', '1250.00', '1400.00', 30, localtimestamp, localtimestamp),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', '1600.00', '300.00', 30, localtimestamp, localtimestamp),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', '1500.00', '0.00', 30, localtimestamp, localtimestamp),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', '950.00', '0.00', 30, localtimestamp, localtimestamp),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', '1250.00', '500.00', 40, localtimestamp, localtimestamp),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', '3000.00', '0.00', 20, localtimestamp, localtimestamp),
(7369, 'SMITH', 'CLERK', 7902, '1981-12-17', '800.00', '0.00', 20, localtimestamp, localtimestamp),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', '3000.00', '0.00', 20, localtimestamp, localtimestamp),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', '1100.00', '0.00', 20, localtimestamp, localtimestamp),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-22', '1300.00', '0.00', 10, localtimestamp, localtimestamp);")
