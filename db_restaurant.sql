USE db_zoo_seth;

SELECT * FROM tbl_habitat; /* Drill 1 */

SELECT * FROM tbl_species; /* Drill 2 */

SELECT species_name FROM tbl_species WHERE species_order = 3; 

SELECT * FROM tbl_nutrition; /* Drill 3 */

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600; 

SELECT species_name FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206; /* Drill 4 */

SELECT		/* Drill 5 */
	species_name AS 'Species Name', a2.nutrition_type AS 'Nutrition Type'
	FROM  tbl_species a1
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
;

SELECT 
	species_name, b3.care_id, b2.specialist_fname, b2.specialist_lname, b2.specialist_contact 
	FROM tbl_species b1
	INNER JOIN tbl_care b3
	ON b3.care_id = b1.species_care
	INNER JOIN tbl_specialist b2 
	ON b2.specialist_id = b3.care_specialist
	WHERE species_name = 'penguin'
;
	

/* Drill 7 */

CREATE DATABASE db_drill_7;

SELECT * FROM tbl_restaurant;

DROP TABLE tbl_ingredients;

CREATE TABLE tbl_ingredients (
	ingredient_id INT PRIMARY KEY NOT NULL IDENTITY (4000,10),
	ingredient_name VARCHAR(50) NOT NULL,
	ingredient_origin VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_theme (
	theme_id INT PRIMARY KEY NOT NULL IDENTITY (11,11),
	theme_name VARCHAR(50) NOT NULL,
	theme_ingredients INT NOT NULL CONSTRAINT fk_ingredient_id FOREIGN KEY REFERENCES tbl_ingredients(ingredient_id) ON UPDATE CASCADE ON DELETE CASCADE,

)

CREATE TABLE tbl_restaurant (
	restaurant_id INT PRIMARY KEY NOT NULL IDENTITY (210,10),
	restaurant_name VARCHAR(50) NOT NULL,
	restaurant_address VARCHAR(50) NOT NULL,
	restaurant_theme INT NOT NULL CONSTRAINT fk_theme_id FOREIGN KEY REFERENCES tbl_theme(theme_id) ON UPDATE CASCADE ON DELETE CASCADE,
	restaurant_rating INT
)


INSERT INTO tbl_ingredients
		(ingredient_name, ingredient_origin)
		VALUES 
		('salt', 'US'),
		('cilantro', 'US'),
		('tortilla', 'Mexico'),
		('lime', 'Cuba'),
		('cotija', 'Mexico'),
		('guajillo', 'Mexico')
	;


INSERT INTO tbl_theme
		(theme_ingredients, theme_name)
		VALUES 
		(4000, 'General'),
		(4010, 'Mexican'),
		(4020, 'Mexican'),
		(4030, 'Caribbean'),
		(4040, 'Mexican'),
		(4050, 'Mexican')
	;


INSERT INTO tbl_restaurant
		(restaurant_name, restaurant_address, restaurant_theme, restaurant_rating)
		VALUES 
		('Pad Thai Kitchen', '1234 SE Food Street', 11, 5),
		('Guero', '1234 SE Food Street', 22, 5),
		('Cubo De Cuba', '1234 SE Food Street', 33, 4),
		('Los Gorditos', '1234 SE Food Street', 44, 4),
		('Lardo', '1234 SE Food Street', 55, 3),
		('Laughing Planet', '1234 SE Food Street', 66, 2)
	;



USE db_drill_7;

SELECT a1.restaurant_name, a2.theme_name
	FROM tbl_restaurant a1
	INNER JOIN tbl_theme a2 ON a2.theme_id = a1.restaurant_theme
;

