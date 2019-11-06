--2.Write a query that returns the namefirst and namelast fields of the people table, along with the inducted field from the hof_inducted table. All rows from the people table should be returned, and NULL values for the fields from hof_inducted should be returned when there is no match found.
SELECT people.playerid, people.namefirst, people.namelast, hof_inducted.inducted
FROM people LEFT OUTER JOIN hof_inducted
ON people.playerid = hof_inducted.playerid;

--3.In 2006, a special Baseball Hall of Fame induction was conducted for players from the negro baseball leagues of the 20th century. In that induction, 17 players were posthumously inducted into the Baseball Hall of Fame. Write a query that returns the first and last names, birth and death dates, and birth countries for these players. Note that the year of induction was 2006, and the value for votedby will be “Negro League.”
--LEFT OUTER JOIN and INNER JOIN have the same result.
SELECT namefirst, namelast, birthyear, deathyear, birthcountry
FROM people LEFT OUTER JOIN hof_inducted
ON people.playerid = hof_inducted.playerid
WHERE (yearid = 2006 AND votedby = 'Negro League');

--4.Write a query that returns the yearid, playerid, teamid, and salary fields from the salaries table, along with the category field from the hof_inducted table. Keep only the records that are in both salaries and hof_inducted. Hint: While a field named yearid is found in both tables, don’t JOIN by it. You must, however, explicitly name which field to include.

SELECT salaries.yearid, salaries.playerid, salaries.teamid, salaries.salary, hof_inducted.category
FROM salaries INNER JOIN hof_inducted
ON hof_inducted.playerid = salaries.playerid;

--5.Write a query that returns the playerid, yearid, teamid, lgid, and salary fields from the salaries table and the inducted field from the hof_inducted table. Keep all records from both tables.
SELECT salaries.playerid, salaries.yearid, teamid, lgid, salary, inducted
FROM salaries FULL OUTER JOIN hof_inducted
ON salaries.playerid = hof_inducted.playerid;

--6.There are 2 tables, hof_inducted and hof_not_inducted, indicating successful and unsuccessful inductions into the Baseball Hall of Fame, respectively.
--6-1.Combine these 2 tables by all fields. Keep all records.
--6-2.Get a distinct list of all player IDs for players who have been put up for HOF induction.
SELECT * FROM hof_inducted
UNION ALL
SELECT * FROM hof_not_inducted;

SELECT playerid FROM hof_inducted
UNION
SELECT playerid FROM hof_not_inducted;

--7.Write a query that returns the last name, first name (see people table), and total recorded salaries for all players found in the salaries table.
SELECT namelast, namefirst, SUM(salary)
FROM salaries LEFT OUTER JOIN people
ON people.playerid = salaries.playerid
GROUP BY namelast, namefirst
ORDER BY namelast, namefirst;

--8.Write a query that returns all records from the hof_inducted and hof_not_inducted tables that include playerid, yearid, namefirst, and namelast.
SELECT * 
FROM hof_inducted LEFT OUTER JOIN people
ON people.playerid = hof_inducted.playerid
UNION
SELECT * 
FROM hof_not_inducted LEFT OUTER JOIN people
ON people.playerid = hof_not_inducted.playerid

--this is answer.
SELECT hof_inducted.playerid, yearid, namefirst, namelast 
FROM hof_inducted LEFT OUTER JOIN people
ON hof_inducted.playerid = people.playerid

UNION ALL 

SELECT hof_not_inducted.playerid, yearid, namefirst, namelast 
FROM hof_not_inducted LEFT OUTER JOIN people
ON hof_not_inducted.playerid = people.playerid;

--9.Return a table including all records from both hof_inducted and hof_not_inducted, and include a new field, namefull, which is formatted as namelast , namefirst (in other words, the last name, followed by a comma, then a space, then the first name). The query should also return the yearid and inducted fields. Include only records since 1980 from both tables. Sort the resulting table by yearid, then inducted so that Y comes before N. Finally, sort by the namefull field, A to Z.
SELECT hof_inducted.playerid, CONCAT(namefirst, ' '  , namelast) AS namefull, yearid, inducted
FROM hof_inducted LEFT OUTER JOIN people
ON hof_inducted.playerid = people.playerid
WHERE yearid >='1980'
UNION ALL
SELECT hof_not_inducted.playerid, CONCAT(namefirst, ' '  , namelast) AS namefull, yearid, inducted
FROM hof_not_inducted LEFT OUTER JOIN people
ON hof_not_inducted.playerid = people.playerid
WHERE yearid >='1980'
ORDER BY yearid, inducted DESC, namefull;

--10.Write a query that returns the highest annual salary for each teamid, ranked from high to low, along with the corresponding playerid. Bonus! Return namelast and namefirst in the resulting table. 
SELECT teamid, salary, namelast, namefirst, yearid
FROM salaries LEFT OUTER JOIN people
ON salaries.playerid = people.playerid
WHERE salary IN
	(SELECT MAX(salary)
	FROM salaries
	GROUP BY teamid)
ORDER BY salary


WITH max AS
(SELECT MAX(salary) as max_salary, teamid, yearid
FROM salaries
GROUP BY teamid, yearid)
SELECT salaries.yearid, salaries.teamid, salaries.playerid, namelast, namefirst, max.max_salary
FROM salaries LEFT OUTER JOIN people
ON salaries.playerid = people.playerid
RIGHT OUTER JOIN max
ON salaries.teamid = max.teamid AND salaries.yearid = max.yearid AND salaries.salary = max.max_salary
ORDER BY max.max_salary DESC;

--11.Select birthyear, deathyear, namefirst, and namelast of all the players born since the birth year of Babe Ruth (playerid = ruthba01). Sort the results by birth year from low to high.
SELECT birthyear, deathyear, namefirst, namelast
FROM people
WHERE birthyear >= ANY
	(SELECT birthyear
	FROM people
	WHERE playerid = 'ruthba01')
ORDER BY birthyear;

--12.Using the people table, write a query that returns namefirst, namelast, and a field called usaborn where. The usaborn field should show the following: if the player's birthcountry is the USA, then the record is 'USA.' Otherwise, it's 'non-USA.' Order the results by 'non-USA' records first.
SELECT namefirst, namelast,
CASE
	WHEN birthcountry = 'USA' THEN 'USA'
	ELSE 'non-USA'
END AS usaborn
FROM people
ORDER BY 3;

--13.Calculate the average height for players throwing with their right hand versus their left hand. Name these fields right_height and left_height, respectively.
SELECT 
AVG(CASE WHEN throws = 'R' THEN height END) AS right_height,
AVG(CASE WHEN throws = 'L' THEN height END) AS left_height
FROM people;

--14.Get the average of each team's maximum player salary since 2010.
WITH max_salary AS
(
	SELECT teamid, MAX(salary) AS max_sal
	FROM salaries
	WHERE yearid > 2010
	GROUP BY teamid
)
SELECT AVG(max_sal) FROM max_salary;

