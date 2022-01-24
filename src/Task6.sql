-- Индексы создаются на поля по которым, на мой взгляд, чаще всего ищут вакансии/резюме
CREATE INDEX employer_id_index ON vacancy (employer_id); -- для просмотра вакансий компании
CREATE INDEX title_index ON vacancy (title);
CREATE INDEX area_id_index ON vacancy (area_id);
CREATE INDEX experience_id_index ON vacancy (experience_id);

CREATE INDEX user_id_index ON application (user_id); -- для просмотра каждым пользователем своих резюме
CREATE INDEX position_name_index ON application (position_name);
CREATE INDEX area_id_index ON application (area_id);

CREATE INDEX vacancy_id_index ON reply (vacancy_id); -- для просмотра всех откликов на вакансию
CREATE INDEX application_id_index ON reply (application_id); -- для просмотра всех вакансий, на которые ткликнулся пользователь своим резюме

-- индексы создаются на id вакансии и id резюме, т. к. при просмотре вакансии или резюме идет обращение к таблице по
-- соответствующему id для определения специализаций
CREATE INDEX vacancy_id_index ON specialization (vacancy_id);
CREATE INDEX application_id_index ON specialization (application_i);