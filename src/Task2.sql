-- Заполняем таблицу вакансий
with test_data(id, title, salary, region, description, experience) AS (
	SELECT generate_series(1, 10000) AS id, md5(random()::text) AS title, round((random()*10000+1)::int, -3) AS salary,
	random()*99+1 AS region,  md5(random()::text) AS description,  random() * 4 AS experience
)
INSERT INTO vacancy(employer_id, title, compensation_from, compensation_to, area_id, description, experience_id, archive_flg)
SELECT 1, title, salary, salary + 15000, region, description, experience, true
FROM test_data;

-- Заполняем таблицу резюме
with test_data(id, user_id, title, region, skills, salary, education_id, availability) AS (
	SELECT generate_series(1, 100000) AS id, random()*100000 AS user_id, md5(random()::text) AS title, random()*99+1 AS region,
	 md5(random()::text) AS skills, round((random()*10000+1)::int, -3) AS salary, random() * 8 AS education_id,
	 random() * 8 AS availability
)
INSERT INTO application(user_id, position_name, area_id, experience_flg, skills, salary, education_level_id, relocation_flg, availability_id)
SELECT user_id, title, region, true, skills, salary, education_id, false, availability
FROM test_data;
