Select e.emp_no,
       e.first_name,
       e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

Select * from retirement_titles;





-- Use Distinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
                   rt.first_name,
                   rt.last_name,
                   rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC

SELECT * from unique_titles;
--SELECT COUNT(emp_no) from unique_titles;
--Retrieve the number of employees by their most recent job title who are about to retire 

SELECT COUNT(DISTINCT title) from unique_titles;

SELECT COUNT(emp_no),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC

SELECT * from retiring_titles;

Select DISTINCT ON (e.emp_no) e.emp_no,
       e.first_name,
       e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
     AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, t.title

SELECT * from mentorship_eligibility;

--SELECT COUNT(emp_no) from mentorship_eligibility;