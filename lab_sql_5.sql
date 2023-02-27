# Lab | SQL Queries 5

### Instructions
USE sakila;

# 1. Drop column `picture` from `staff`.
SELECT picture
FROM staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT *
FROM staff
LIMIT 5;

# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT *
FROM customer
WHERE first_name = 'TAMMY';

INSERT INTO staff VALUES(3,'Tammy','Sandres',79,'Tammy.Sanders@sakilastaff.com',2,1,'Tammy','','2006-02-15 04:57:16');

SELECT *
FROM staff;

# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
# **Hint**: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need `customer_id` information as well. To get that you can use the following query:

select * from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
Select *
FROM film
WHERE title = 'Academy Dinosaur';

SELECT *
FROM inventory
WHERE inventory_id = 4582;

INSERT INTO inventory VALUES(4582,1,1,'2006-02-16 05:03:42');
INSERT INTO rental VALUES(16050,'2006-02-14 15:16:03',4582,130,NULL,1,'2006-02-16 05:03:42');

SELECT *
FROM rental
WHERE rental_id = 16050;


# Use similar method to get `inventory_id`, `film_id`, and `staff_id`.

# 4. Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:

   -- Check if there are any non-active users
   
   SELECT *
   FROM customer
   WHERE active  = 0;
   
   -- Create a table _backup table_ as suggested
   
   CREATE TABLE backup_table1(
customer_id int(11) default null,
store_id int(6),
first_name text,
last_name text,
email text,
address_id int(6),
active int(3),
create_date datetime,
last_update datetime
);

SELECT *
FROM backup_table;

   -- Insert the non active users in the table _backup table_

INSERT INTO backup_table VALUES(16,2,'SANDRA','MARTIN','SANDRA.MARTIN@sakilacustomer.org',20,0,'2006-02-14 22:04:36','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(64,2,'JUDITH','COX','JUDITH.COX@sakilacustomer.org',68,0,'2006-02-14 22:04:36','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(124,1,'SHEILA','WELLS','SHEILA.WELLS@sakilacustomer.org',128,0,'2006-02-14 22:04:36','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(169,2,'ERICA','MATTHEWS','ERICA.MATTHEWS@sakilacustomer.org',173,0,'2006-02-14 22:04:36','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(241,2,'HEIDI','LARSON','HEIDI.LARSON@sakilacustomer.org',245,0,'2006-02-14 22:04:36','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(271,1,'PENNY','NEAL','PENNY.NEAL@sakilacustomer.org',276,0,'2006-02-14 22:04:36','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(315,2,'KENNETH','GOODEN','KENNETH.GOODEN@sakilacustomer.org',320,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(368,1,'HARRY','ARCE','HARRY.ARCE@sakilacustomer.org',373,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(406,1,'NATHAN','RUNYON','NATHAN.RUNYON@sakilacustomer.org',411,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(446,2,'THEODORE','CULP','THEODORE.CULP@sakilacustomer.org',451,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(482,1,'MAURICE','CRAWLEY','MAURICE.CRAWLEY@sakilacustomer.org',487,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(510,2,'BEN','EASTER','BEN.EASTER@sakilacustomer.org',515,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(534,1,'HRISTIAN','JUNG','CHRISTIAN.JUNG@sakilacustomer.org',540,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(558,1,'JIMMIE','EGGLESTON','JIMMIE.EGGLESTON@sakilacustomer.org',564,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');
INSERT INTO backup_table VALUES(592,1,'TERRANCE','ROUSH','TERRANCE.ROUSH@sakilacustomer.org',598,0,'2006-02-14 22:04:37','2006-02-15 04:57:20');

SELECT *
from backup_table;

   -- Delete the non active users from the table _customer_
   # It is not safe to delete values from the original table, hence not performing the above query
