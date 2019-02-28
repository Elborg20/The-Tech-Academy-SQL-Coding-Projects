Use db_zoo
/*--Select all from tbl_habitat --*/
Select * from tbl_habitat
/*--Select all the species names where the species order equals 3 --*/
Select species_name
from tbl_species
where species_order = 3
/*-- Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less. --*/
Select nutrition_type
from tbl_nutrition
where nutrition_cost <= 600
/*-- Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table. --*/
select a1.species_name
from tbl_species a1
inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition
where a2.nutrition_id between 2202 and 2206
/*--Retrieve all names within the species_name column using the alias "Species Name:" from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table. --*/
select a1.species_name AS 'Species Name', a2.nutrition_type AS 'Nutrition Type'
from tbl_species a1
inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition
/*--From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table.--*/
select a2.specialist_fname, a2.specialist_lname, specialist_contact
from tbl_specialist a2
inner join tbl_care a1 on a1.care_specialist = a2.specialist_id
inner join tbl_species a3 on a3.species_care = a1.care_id
where a3.species_name = 'penguin'

/*drill 7*/

create DATABASE db_drill7

use db_drill7

create table tbl_employees (
employee_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
employee_fname VARCHAR(50) NOT NULL,
employee_lname VARCHAR(50) NOT NULL,
employee_contact varchar(50) NOT NULL
)

create table tbl_jobs (
job_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
job_desc VARCHAR(50),
job_employee int NOT NULL CONSTRAINT fk_employee_id references tbl_employees ON UPDATE CASCADE ON DELETE CASCADE,
)

INSERT INTO tbl_employees
	(employee_fname, employee_lname, employee_contact)
	values
	('Joe','Smith','333-333-1215'),
	('John','Doe','555-555-1753'),
	('Craig', 'Stanley','465-321-8721'),
	('Frank', 'Johnson', '674-215-6433')
;

INSERT INTO tbl_jobs
	(job_desc, job_employee)
	values
	('Painting', 3),
	('Sanding', 3),
	('Construction', 4),
	('Demolition', 4),
	('Sanitation', 1),
	('Supplies', 2),
	('Admin', 2),
	('Plumbing', 1)
;

SELECT * FROM tbl_employees
SELECT * FROM tbl_jobs

SELECT a1.employee_contact, a2.job_desc
FROM tbl_employees a1
INNER JOIN tbl_jobs a2 ON a2.job_employee = a1.employee_id
