CREATE TABLE salary_per_title (
  title TEXT PRIMARY KEY,
  total_yearly_compensation INT
);

SELECT * FROM salary_per_title;
DROP TABLE salary_per_title;

CREATE TABLE salary_per_experience (
	title TEXT PRIMARY KEY,
	years_of_experience FLOAT,
	total_yearly_compensation INT
);	

SELECT * FROM salary_per_experience;
DROP TABLE salary_per_experience;

CREATE TABLE salary_per_location (
  title TEXT PRIMARY KEY,
  city_state TEXT,
  total_yearly_compensation INT
);	

SELECT * FROM salary_per_location;
DROP TABLE salary_per_location;
