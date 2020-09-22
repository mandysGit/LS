CREATE TABLE birds (
  id      SERIAL PRIMARY KEY,
  name    VARCHAR(25),
  age     INTEGER,
  species VARCHAR(15)
);

INSERT INTO birds (name, age, species)
  VALUES ('Charlie', 3, 'Finch'),
         ('Allie', 5, 'Owl'),
         ('Jennifer', 3, 'Magpie'),
         ('Jamie', 4, 'Owl'),
         ('Roy', 8, 'Crow')
;

SELECT *
FROM birds;


SELECT * 
FROM birds
WHERE age < 5;


UPDATE birds
SET species = 'Raven'
WHERE id = 5;


UPDATE birds
SET species = 'Hawk'
WHERE id = 4;


DELETE FROM birds
WHERE age = 3 AND species = 'Finch';


/* auto generated constraint name generated, use this shorthand: */
ALTER TABLE birds
ADD CHECK (age > 0);

ALTER TABLE birds
ADD CONSTRAINT check_age
CHECK (age > 0);


DROP TABLE birds;
DROP TABLE IF EXISTS birds;
DROP TABLE birds, reptiles;

DROP DATABASE animals;
drop db animals
