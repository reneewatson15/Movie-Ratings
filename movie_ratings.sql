CREATE TABLE participants (
	user_id SERIAL PRIMARY KEY,
	name VARCHAR (50) NOT NULL
);

INSERT INTO participants (name) VALUES
('Person 1'),
('Person 2'),
('Person 3'),
('Person 4'),
('Person 5');

SELECT * FROM participants;

CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY, 
	title VARCHAR(100) NOT NULL
);

INSERT INTO movies (title) VALUES
('Spider-Man: Brand New Day'),
('Sinners'),
('The Odyssey'),
('Michael'),
('Toy Story 5'),
('Obsession');

SELECT * FROM movies;

CREATE TABLE ratings(
	user_id INTEGER,
	movie_id INTEGER,
	rating INTEGER,
	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id) REFERENCES participants(user_id),
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
	CHECK (rating BETWEEN 1 AND 5 OR rating IS NULL)	
);

SELECT * FROM ratings;

INSERT INTO ratings (user_id, movie_id, rating) VALUES
(1, 1, 5),
(1, 2, 4),
(1, 3, NULL),
(1, 4, 5),
(1, 5, 4),
(1, 6, 4),

(2, 1, 4),
(2, 2, 5),
(2, 3, 4),
(2, 4, 5),
(2, 5, NULL),
(2, 6, 3),

(3, 1, 5),
(3, 2, NULL), 
(3, 3, 5),
(3, 4, 4),
(3, 5, 2),
(3, 6, 5),

(4, 1, 4),
(4, 2, 4), 
(4, 3, NULL),
(4, 4, 4),
(4, 5, 3),
(4, 6, NULL),

(5, 1, 5),
(5, 2, 5), 
(5, 3, 3),
(5, 4, 5),
(5, 5, NULL), 
(5, 6, NULL);

SELECT * FROM ratings;

SELECT
	p.name AS participant,
	m.title AS movie,
	r.rating
FROM ratings AS r
JOIN participants AS p
	ON r.user_id = p.user_id
JOIN movies AS m
	ON r.movie_id = m.movie_id
ORDER BY p.user_id, m.movie_id;