--1.How many records are in the vehicles table? => 334442
SELECT COUNT (*)
FROM vehicles;

--2.Write a query that returns all the records in the vehicles table.
SELECT *
FROM vehicles;

--3.Write a query that returns the id, make, and model fields for all the records for 2010 vehicles.
SELECT id, make, model
FROM vehicles
WHERE year = 2010;

--4.Write a query that returns the count of vehicles from 2010. Also provide the answer.
--1109
SELECT COUNT(*)
FROM vehicles
WHERE year = 2010;

--5.Write a query that returns the count of vehicles in the vehicles table between the years 2010 and 2015, inclusive. 
--5995
SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 2010 AND 2015;

--6.Write a query that returns the count of vehicles from the years 1990, 2000, and 2010.
--3026
SELECT COUNT(*)
FROM vehicles
WHERE year = 1990 OR year = 2000 OR year = 2010;

--7.Write a query that returns the count of all records between 1987 and 2005, exclusive of the years 1990 and 2000.
--17235
SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 1987 AND 2005
AND year != 1990
AND year != 2000;
	
--8.Write a query that returns the year, make, model, and a field called average_mpg that calculates the average highway/city fuel consumption. 
SELECT year, make, model, (hwy + cty)/2 AS average_mpg
FROM vehicles

--9.Write a query that returns the year, make, model, and a text field displaying “X highway; Y city.”
SELECT year, make, model, CONCAT(hwy, ' highway; ', cty, ' city.')
FROM vehicles

--10.Write a query that returns the id, make, model, and year for all records that have NULL for either the cyl or displ fields.
SELECT id, make, model, year
FROM vehicles
WHERE cyl IS NULL
OR displ IS NULL;

--11.Write a query that returns all fields for records with rear-wheel drive and diesel vehicles since 2000, inclusive. 
--Also sort by year and highway mileage, both descending. 
SELECT *
FROM vehicles
WHERE drive = 'Rear-Wheel Drive' 
AND fuel = 'Diesel' 
AND year >= 2000
ORDER BY year DESC, hwy DESC;

--12.Write a query that counts the number of vehicles that are either Fords or Chevrolets and either compact cars or 2-seaters.
--SELECT COUNT(*) 
--FROM vehicles
--WHERE
    --make = 'Ford' OR make = 'Chevrolet')
    --AND class = 'Compact Cars' OR class = 'Two Seaters');


SELECT COUNT(*) 
FROM vehicles
WHERE
    make IN ('Ford', 'Chevrolet')
    AND class in ('Compact Cars', 'Two Seaters');

--13.Write a query that returns the records for 10 vehicles with the highest highway fuel mileage.
SELECT *
FROM vehicles
ORDER BY hwy DESC 
LIMIT 10;

--14.Write a query that returns all the records of vehicles since the year 2000 whose model name starts with a capital X. 
--Sort the list A through Z by make. What happens when you use a lowercase “x” instead?
SELECT *
FROM vehicles
WHERE year >= 2000
AND model ILIKE 'x%'
ORDER BY make;

--15.Write a query that returns the count of records where the “cyl” field is NULL. 
--58
SELECT COUNT (*)
FROM vehicles
WHERE cyl IS NULL;

--16.Write a query that returns the count of all records before the year 2000 
--that got more than 20 mpg hwy and had greater than 3 liters displacement (“displ” field). 
--1964
SELECT COUNT (*)
FROM vehicles
WHERE year < 2000
AND hwy > 20
AND displ > 3;

--17.Write a query that returns all records whose model name has a (capital) X in its 3rd position. 
SELECT *
FROM vehicles
WHERE model LIKE '__X%';

