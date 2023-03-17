-- основные таблицы

CREATE TABLE person
(
	person_id int PRIMARY KEY,
	first_name varchar(64) NOT NULL,
	middle_name varchar(64),
	last_name varchar(64) NOT NULL,
	birthday date
);

CREATE TABLE genre
(
	genre_id int PRIMARY KEY,
	genre_name varchar(64) NOT NULL
);

CREATE TABLE country
(
	country_id int PRIMARY KEY,
	country_name varchar(64) NOT NULL
);

CREATE TABLE film
(
	film_id int PRIMARY KEY,
	title varchar(64) NOT NULL,
	release_date date NOT NULL,
	tagline text,
	fk_person_director_id int REFERENCES person(person_id),
	fk_person_screenwriter_id int REFERENCES person(person_id),
	fk_person_producer_id int REFERENCES person(person_id),
	fk_person_operator_id int REFERENCES person(person_id),
	fk_person_composer_id int REFERENCES person(person_id),
	fk_person_artist_id int REFERENCES person(person_id),
	fk_person_editor_id int REFERENCES person(person_id),
	budget money, -- все money можно заменить на numeric или int. 
	marketing money, -- думаю, это зависит от договоренностей в команде.
	usa_fees money,
	world_fees money,
	russia_premiere date,
	world_premiere date,
	dvd_release date,
	age_restriction smallint NOT NULL,
	mpaa_rating varchar(5) NOT NULL,
	view_time time NOT NULL
);


-- таблицы связей m2m

CREATE TABLE country_film
(
	country_id int REFERENCES country(country_id),
	film_id int REFERENCES film(film_id),
	audience int NOT NULL,
	
	CONSTRAINT country_film_pk PRIMARY KEY (country_id, film_id)
);

CREATE TABLE person_film_main_character
(
	person_id int REFERENCES person(person_id),
	film_id int REFERENCES film(film_id),
	
	CONSTRAINT person_film_main_character_pk PRIMARY KEY (person_id, film_id)
);

CREATE TABLE person_film_dubbing
(
	person_id int REFERENCES person(person_id),
	film_id int REFERENCES film(film_id),
	
	CONSTRAINT person_film_dubbing_pk PRIMARY KEY (person_id, film_id)
);

CREATE TABLE genre_film
(
	genre_id int REFERENCES genre(genre_id),
	film_id int REFERENCES film(film_id),
	
	CONSTRAINT genre_film_pk PRIMARY KEY (genre_id, film_id)
);







