SELECT *
FROM ksprojects;

--1
SELECT DISTINCT country
FROM ksprojects;

--2
SELECT COUNT(DISTINCT main_category), COUNT(DISTINCT category)
FROM ksprojects;

--3
SELECT DISTINCT main_category, category
FROM ksprojects
ORDER BY main_category;

--4
SELECT main_category, COUNT(DISTINCT(category))
FROM ksprojects
GROUP BY main_category
ORDER BY main_category;

--5
SELECT main_category, ROUND(AVG(backers),0) AS ave_backers
FROM ksprojects
GROUP BY main_category
ORDER BY ave_backers DESC;

--6
--Missed
SELECT COUNT(NULLIF(state, 'failed')), AVG(goal - usd_pledged) AS difference
FROM ksprojects
GROUP BY category;

SELECT category, avg(usd_pledged - goal) as raised_over_goal, count(*)
FROM ksprojects
WHERE state = 'successful'
GROUP BY category;

--7
SELECT main_category, MAX(goal), COUNT(*)
FROM ksprojects
WHERE backers = 0
GROUP BY main_category;

--8
--Why cant use "WHERE ave_pledged < 50"
SELECT category, (AVG(NULLIF(usd_pledged,0))/COUNT(backers)) AS ave_pledged
FROM ksprojects
GROUP BY category
HAVING AVG(NULLIF(usd_pledged,0))/COUNT(backers) < 50
ORDER BY ave_pledged DESC;

SELECT category, (AVG(usd_pledged)/COUNT(NULLIF(backers,0)))AS ave_pledged
FROM ksprojects
GROUP BY category
HAVING (AVG(usd_pledged)/COUNT(NULLIF(backers,0)))< 50
ORDER BY ave_pledged DESC;

--9
--miss
SELECT main_category, COUNT(NULLIF(state,'failed'))
FROM ksprojects
WHERE backers BETWEEN 5 AND 10
GROUP BY main_category;

SELECT main_category, COUNT(*)
FROM ksprojects
WHERE state= 'successful' AND backers BETWEEN 5 AND 10
GROUP BY main_category;

--10
SELECT currency, SUM(pledged) AS total_pledged, SUM(usd_pledged) AS total_usd_pledged
FROM ksprojects
GROUP BY currency
ORDER BY total_pledged DESC;

--11
SELECT main_category, SUM(backers)
FROM ksprojects
WHERE main_category NOT IN('Games', 'Technology') AND state = 'successful'
GROUP BY main_category
HAVING SUM(backers) > 100000
ORDER BY main_category;
