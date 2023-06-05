# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Courses_12
(
student varchar(255), 
class varchar(255));

Truncate table Courses_12;

insert into Courses_12 (student, class) values ('A', 'Math');
insert into Courses_12 (student, class) values ('B', 'English');
insert into Courses_12 (student, class) values ('C', 'Math');
insert into Courses_12 (student, class) values ('D', 'Biology');
insert into Courses_12 (student, class) values ('E', 'Math');
insert into Courses_12 (student, class) values ('F', 'Computer');
insert into Courses_12 (student, class) values ('G', 'Math');
insert into Courses_12 (student, class) values ('H', 'Math');
insert into Courses_12 (student, class) values ('I', 'Math');

/*
Write an SQL query to report all the classes that have at least five students.
Return the result table in any order.
The query result format is in the following example.

Example 1:

Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.
*/

# TYPE 1 :- HAVING
SELECT class 
FROM Courses_12
GROUP BY class
HAVING COUNT(class)>=5;

# NOTE  :- If "student" column even if it is not contain primary key data-type then use below code.
# TYPE 1 :- HAVING
SELECT class 
FROM Courses_12
GROUP BY class
HAVING COUNT(class)>=5 AND COUNT(DISTINCT student)>=5;

# TYPE 2 :- SUB-QUERY 
SELECT class
FROM 
    (SELECT class, count(DISTINCT student) AS times
    FROM Courses_12
    GROUP BY class) AS temp
WHERE times >= 5;

