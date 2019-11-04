SELECT *
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno;

SELECT empno, ename, dept.deptno, dname
FROM dept LEFT OUTER JOIN emp
ON emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM dept RIGHT OUTER JOIN emp
ON emp.deptno = dept.deptno;

SELECT empno, ename, dept.deptno, dname
FROM dept FULL OUTER JOIN emp
ON emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname, cty, state
FROM emp

LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno

LEFT OUTER JOIN loc
ON dept.locno = loc.locno;

SELECT empno, ename, emp.deptno, dname, cty, state
FROM emp

INNER JOIN dept
ON emp.deptno = dept.deptno

INNER JOIN loc
ON dept.locno = loc.locno;

SELECT empno, ename, emp.deptno, dname
FROM emp LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno
WHERE mgr = 7698;

SELECT emp.deptno, dname, SUM(sal)
FROM emp LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno
GROUP BY emp.deptno, dname;

SELECT emp.deptno, dname, SUM(sal) AS dept_salary
FROM emp LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno
WHERE empno BETWEEN 7500 AND 8000
GROUP BY emp.deptno, dname
HAVING SUM(sal) > 3000
ORDER BY dname;

SELECT deptno, dname, locno FROM dept
UNION
SELECT deptno, dname, locno FROM dept2;

SELECT * FROM dept
UNION
SELECT * FROM dept2;

SELECT deptno, dname FROM dept
UNION
SELECT deptno, dname FROM dept2;

SELECT locno FROM dept
UNION ALL
SELECT locno FROM dept2;

SELECT locno FROM dept
UNION
SELECT locno FROM dept2; 

SELECT * FROM dept
WHERE locno <> 50
UNION
SELECT * FROM dept2
WHERE locno <> 50

SELECT * FROM dept
WHERE locno <> 50
UNION
SELECT * FROM dept2
WHERE locno <> 50
ORDER BY deptno;

SELECT ename
FROM EMP
WHERE sal >
	(SELECT sal
	FROM emp
	WHERE empno = 7782);
	
SELECT ename, job, hiredate
FROM EMP
WHERE deptno =
	(SELECT deptno
	FROM emp
	WHERE empno = 7782);
	
SELECT ename, sal, deptno
FROM EMP
WHERE sal IN
	(SELECT MAX(sal)
	FROM emp
	GROUP BY deptno);
	
SELECT empno, ename, job, sal
FROM emp
WHERE sal > ANY
	(SELECT sal
	FROM emp
	WHERE job = 'CLERK')
AND job <> 'CLERK';

SELECT empno, ename, job, sal
FROM emp
WHERE sal > ALL
	(SELECT sal
	FROM emp
	WHERE job = 'CLERK');
