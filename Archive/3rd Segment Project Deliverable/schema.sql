CREATE TABLE Company_info (
  ID DECIMAL PRIMARY KEY
  Company_name TEXT,
  City_id INT
  location TEXT,
);

SELECT * FROM salary_by_title;


CREATE TABLE Salary_info (
  title TEXT,
  totalyearlycompensation INT,
  gender TEXT
);

SELECT * FROM salary_by_title_and_gender;
DROP TABLE salary_by_title_and_gender;

CREATE TABLE salary_by_experience (
	title TEXT,
	yearsofexperience FLOAT,
	totalyearlycompensation INT
);	

SELECT * FROM salary_by_experience;
DROP TABLE salary_by_experience;

CREATE TABLE salary_by_location (
  title TEXT,
  state TEXT,
  city TEXT,
  totalyearlycompensation INT
);	

SELECT * FROM salary_by_location;
DROP TABLE salary_by_location;

CREATE TABLE salary_by_education (
  title TEXT,
  Masters_Degree INT,
  Bachelors_Degree INT,
  totalyearlycompensation INT
);	

SELECT * FROM salary_by_education;
DROP TABLE salary_by_education;