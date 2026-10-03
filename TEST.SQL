CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(40),
    location VARCHAR(40)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    salary NUMERIC(10,2),
    department_id INT REFERENCES departments(department_id),
    city VARCHAR(50),
    joining_date DATE,
    manager_id INT,
    bonus NUMERIC(10,2)
);



INSERT INTO departments 
(department_id, department_name, location)
VALUES
(1, 'IT', 'Bangalore'),
(2, 'HR', 'Delhi'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Pune'),
(5, 'Sales', 'Hyderabad'),
(6, 'Operations', 'Chennai');


INSERT INTO employees 
(employee_id, employee_name, age, gender, salary, department_id, city, joining_date, manager_id, bonus)
VALUES
(101, 'Aarav', 28, 'Male', 65000, 1, 'Bangalore', '2022-03-15', 105, 5000),
(102, 'Priya', 32, 'Female', 72000, 2, 'Delhi', '2020-07-10', 108, 8000),
(103, 'Rahul', 25, 'Male', 45000, 1, 'Pune', '2023-01-20', 105, NULL),
(104, 'Sneha', 29, 'Female', 58000, 3, 'Mumbai', '2021-11-05', 109, 4000),
(105, 'Vikram', 40, 'Male', 95000, 1, 'Bangalore', '2018-06-12', NULL, 15000),
(106, 'Neha', 27, 'Female', 52000, 4, 'Pune', '2022-09-01', 110, 3000),
(107, 'Karan', 35, 'Male', 80000, 5, 'Hyderabad', '2019-04-18', 111, 10000),
(108, 'Ananya', 38, 'Female', 90000, 2, 'Delhi', '2017-12-25', NULL, 12000),
(109, 'Rohit', 31, 'Male', 67000, 3, 'Mumbai', '2020-02-14', 108, NULL),
(110, 'Pooja', 26, 'Female', 48000, 4, 'Pune', '2023-06-30', 106, 2500),
(111, 'Amit', 42, 'Male', 105000, 5, 'Hyderabad', '2016-08-22', NULL, 20000),
(112, 'Isha', 30, 'Female', 61000, 1, 'Delhi', '2021-05-17', 105, 4500),
(113, 'Manish', 24, 'Male', 39000, 6, 'Chennai', '2024-02-01', 114, NULL),
(114, 'Kavita', 37, 'Female', 85000, 6, 'Chennai', '2018-10-09', NULL, 11000),
(115, 'Suresh', 33, 'Male', 75000, 3, 'Mumbai', '2019-09-23', 109, 7000),
(116, 'Meera', 29, 'Female', 56000, 2, 'Lucknow', '2022-01-11', 108, NULL),
(117, 'Arjun', 36, 'Male', 88000, NULL, 'Jaipur', '2017-04-05', 105, 9000),
(118, 'Divya', 28, 'Female', 63000, 4, 'Delhi', '2021-08-19', 110, 3500),
(119, 'Nitin', 41, 'Male', 98000, 5, 'Hyderabad', '2018-03-27', 111, NULL),
(120, 'Riya', 23, 'Female', 35000, 6, 'Chennai', '2024-07-15', 114, 1500);


-- question1: Display employee ID, name, salary and city for employees earning more than 60,000.
SELECT employee_id, employee_name, salary, city
FROM employees
WHERE salary > 60000;

-- question2 : Display employees whose age is between 25 and 35, inclusive.
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';


-- question3: Display employees in the IT, HR or Finance departments.
SELECT *
FROM employees
WHERE department_id IN (1, 2,3);

-- question4: Display employees whose names start with 'A'.
select *
from employees
where employee_name like 'A%';


--question5: Find employees whose bonus is NULL.
select *
from employees
where bonus is null;

--question8: Display the five highest-paid employees; sort ties by employee name.

select *
from employees
order by salary DESC, employee_name ASC
limit 5;



-- question9: Find employees earning more than 60,000 who live in Delhi or Mumbai.
select *
from employees
where salary > 60000
and city in ('Delhi', 'Mumbai');


-- question10: Display all distinct employee cities in alphabetical order.
select distinct city
from employees
order by city ASC;

-- question11: Display total employee count, average salary, maximum salary and minimum salary.
select
    count(*) as total_employees,
    AVG(salary) as average_salary,
    MAX(salary) as maximum_salary,
    min(salary) as minimum_salary
from employees;

-- question13: Show total salary by city, only for cities where total salary exceeds 100,000.
select
city,
sum (salary) as total_salary
from employees
group by city
having sum (salary) > 100000;

-- question14:  Find the department ID with the highest average employee salary.
select department_id, avg(salary) AS average_salary
from employees
WHERE department_id IS NOT NULL
GROUP BY department_id
ORDER BY average_salary DESC
LIMIT 1;
-- question15: Count employees by joining year and sort by year.

select extract(year from joining_date) as joiningyear,
  count (*) as employeecount
from employees
group by  extract(year from joining_date)
order by joiningyear;

-- question18: Find employees whose salary is above the overall average salary.
SELECT 
 employee_id,
 employee_name,
 salary
from employees
where salary > (
 select avg(salary)
 from employees
);

-- question20:  Display each employee's name and manager's name, including employees without a manager.
select
    e.employee_name as employee_name,
    m.employee_name as manager_name
from employees e
left join employees m
ON e.manager_id = m.employee_id;