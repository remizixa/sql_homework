(SELECT to_char(v.publication_date, 'MM') AS max_month FROM vacancy v GROUP BY max_month ORDER BY count(*) DESC LIMIT 1)
 UNION ALL
(SELECT to_char(a.creation_date, 'MM') AS max_month FROM application a GROUP BY max_month ORDER BY count(*) desc LIMIT 1);