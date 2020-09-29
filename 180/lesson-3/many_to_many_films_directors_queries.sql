CREATE TABLE directors_films (
  PRIMARY KEY(id),
  id          SERIAL,
  film_id     INT REFERENCES films (id),
  director_id INT REFERENCES directors (id)
);

INSERT INTO directors_films (film_id, director_id)
       VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
              (6, 6), (7, 3), (8, 7), (9, 8), (10, 4);

ALTER TABLE films
DROP COLUMN director_id;

SELECT films.title, directors.name
  FROM films
       INNER JOIN directors_films
       ON films.id = directors_films.film_id
       INNER JOIN directors
       ON directors.id = directors_films.director_id
 ORDER BY films.title;

INSERT INTO directors (name)
       VALUES ('Joel Coen'),
              ('Ethan Coen'), 
              ('Frank Miller'),
              ('Robert Rodriguez');

INSERT INTO films (title, year, genre, duration)
       VALUES ('Fargo', 1996, 'comedy', 98),
              ('No Country for Old Men', 2007, 'western', 122),
              ('Sin City', 2005, 'crime', 124), 
              ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors_films (film_id, director_id)
       VALUES (11, 9), (12, 9), (12, 10), (13, 11),
              (13, 12), (14, 12);


SELECT directors.name AS director, count(films.id) AS films
  FROM films
       INNER JOIN directors_films
       ON films.id = directors_films.film_id
       INNER JOIN directors
       ON directors.id = directors_films.director_id
 GROUP BY directors.name
 ORDER BY films DESC;
