SELECT avg(v.compensation_from) AS avg_salary_from,
       avg(v.compensation_to) AS avg_salary_to,
       avg((v.compensation_from + v.compensation_to)/2) AS avg_salary
FROM vacancy v GROUP BY area_id;