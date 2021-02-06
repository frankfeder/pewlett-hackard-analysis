-- Create table of all roles held by retirement-age employees
select e.emp_no, first_name, last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
from employees e
join titles  t on t.emp_no = e.emp_no
where e.birth_date between '1/1/1952' and '12/31/1955'
order by e.emp_no


-- Get unique (latest) titles for all employees
select DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
into unique_titles
from retirement_titles rt
order by rt.emp_no, rt.to_date desc

-- Get counts of titles of retiring-age employees
select COUNT(ut.title), ut.title
into retiring_titles
from unique_titles ut
GROUP BY ut.title
ORDER BY count(ut.title) desc

--