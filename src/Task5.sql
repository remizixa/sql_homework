SELECT v.vacancy_id, v.title FROM vacancy v
INNER JOIN reply r ON r.vacancy_id = v.vacancy_id
WHERE r.creation_date - v.publication_date <= 7
GROUP BY v.vacancy_id
HAVING count(v.vacancy_id) > 5