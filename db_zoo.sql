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
