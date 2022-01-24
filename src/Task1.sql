-- При создании таблиц ссылаюсь на таблицы, которых нет в рамках дз, но в реальных условиях они должны быть (на мой взгляд)
-- Создание таблицы вакансий
CREATE TABLE vacancy
(
	vacancy_id serial primary key,
	employer_id integer not null references employer(employer_id),
	title text not null,
	compensation_from integer,
	compensation_to integer,
	area_id integer not null references area(area_id),
	description text not null,
	experience_id integer not null references experience(experience_id), -- требуемый опыт работы
	publication_date date default now(),
	archive_flg bool default false -- флаг "В архиве"
);

-- Создание таблицы резюме
CREATE TABLE application
(
	application_id serial primary key,
	user_id integer not null references user(user_id),
	position_name text, -- желаемая должность
	area_id integer not null references area(area_id),
	experience_flg bool not null, -- опыт работы есть/нет
	skills text, --о себе
	salary integer,
	education_level_id integer not null references education(education_id),
	relocation_flg bool, -- готов к перезду
	availability_id integer, -- видимость
	creation_date date default now(), -- дата создания
	update_date date default now() -- дата обновления
);

-- Создание таблицы откликов
CREATE TABLE reply
(
    vacancy_id integer not null references vacancy(vacancy_id),
    application_id integer not null references application(application_id),
    creation_date date default now(),
    cover_letter text, -- сопроводительное письмо
    viewed_flg bool default false,
    replied_flg bool default false, -- отправлено приглашение
    declined_flg bool default false -- отклонен
);

-- Создание таблицы специализаций
CREATE TABLE specialization
(
    id_specialization integer primary key,
    name_specialization text not null,
    vacancy_id integer references vacancy(vacancy_id), -- для каждой специализации заполняется либо значение vacancy_id, либо application_id
    application_id integer references application(application_id)
);
