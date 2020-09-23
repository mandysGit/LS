ALTER TABLE films
ADD COLUMN director varchar(255),
ADD COLUMN duration integer;


UPDATE  films
   SET  duration = 132,
        director = 'John McTiernan'
 WHERE  title = 'Die Hard';

UPDATE films
   SET duration = 102, director = 'Michael Curtiz'
 WHERE title = 'Casablanca';


UPDATE films
   SET duration = 113, director = 'Francis Ford Coppola'
 WHERE title = 'The Conversation';


INSERT INTO films (title, year, genre, director, duration)
       VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90),
              ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
              ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

SELECT  title, (2020 - year) AS age
  FROM  films
 ORDER  BY age ASC;

SELECT  title, duration 
  FROM  films
 WHERE  duration > 120
 ORDER  BY duration DESC;


SELECT  title
  FROM  films
 ORDER  BY duration DESC
 LIMIT  1;
