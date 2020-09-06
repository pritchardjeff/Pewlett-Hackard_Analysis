-- Step 1: Retirement Titles
SELECT e.emp_no, e.first_name, e.last_name, tt.title, tt.from_date, tt.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no DESC;

-- Step 2: Unique Retirement Titles

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, tt.title, tt.from_date, tt.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC, tt.to_date DESC;

--Step 3: Retirement Title Summary

SELECT COUNT(u.emp_no), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.emp_no) Desc;

--Step 4: Mentorship Eligible Employees

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, ed.from_date, ed.to_date, tt.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS ed
ON (e.emp_no = ed.emp_no)
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;
