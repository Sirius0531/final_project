CREATE TABLE Company_info (
  employee_no INTEGER NOT NULL,
  company TEXT,
  location TEXT,
  cityid INT,
  PRIMARY KEY employee_no
);

CREATE TABLE Salary_info (
  employee_no INT NOT NULL,
  title TEXT,
  totalyearlycompensation INT,
  yearsofexperience DOUBLE,
  yearsatcompany DOUBLE,
  basesalary INTEGER,
  stockgrantvalue DOUBLE,
  bonus DOUBLE,
  FOREIGN KEY (employee_no) REFERENCES Company_info(employee_no),
  PRIMARY KEY (employee_no)
);

CREATE TABLE Employee_info (
	employee_no INT,
	yearsofexperience DOUBLE,
	yearsatcompany DOUBLE,
	gender TEXT,
	Masters_Degree TEXT,
	Bachelors_Degree TEXT,
	Doctorate_Degree TEXT,
	Highschool TEXT
	FOREIGN KEY (employee_no) REFERENCES Company_info(employee_no),
    PRIMARY KEY (employee_no)
);

SELECT * FROM company_info;
SELECT * FROM employee_info;
SELECT * FROM salary_info;

SELECT si.title, si.totalyearlycompensation, si.yearsofexperience, si.yearsatcompany, si.basesalary, si.stockgrantvalue, 
si.bonus, ci.company, ci.location, ci.cityid, ei.gender, ei."Masters_Degree", ei."Bachelors_Degree", ei."Doctorate_Degree", ei."Highschool"
INTO cleaned_df
FROM salary_info as si
FULL OUTER JOIN employee_info as ei
ON ei.employee_no = si.employee_no
RIGHT JOIN company_info as ci
ON ci.employee_no = si.employee_no;

SELECT * FROM cleaned_df;

