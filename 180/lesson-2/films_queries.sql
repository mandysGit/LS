ALTER TABLE films ALTER COLUMN title SET NOT NULL;
ALTER TABLE films ALTER COLUMN year SET NOT NULL;
ALTER TABLE films ALTER COLUMN genre SET NOT NULL;
ALTER TABLE films ALTER COLUMN director SET NOT NULL;
ALTER TABLE films ALTER COLUMN duration SET NOT NULL;


ALTER TABLE films ADD CONSTRAINT title_unique UNIQUE (title);
ALTER TABLE films ALTER COLUMN year SET NOT NULL;
ALTER TABLE films ALTER COLUMN genre SET NOT NULL;
ALTER TABLE films ALTER COLUMN director SET NOT NULL;
ALTER TABLE films ALTER COLUMN duration SET NOT NULL;


ALTER TABLE films
ADD CONSTRAINT title_unique
UNIQUE (title);

ALTER TABLE films
DROP CONSTRAINT title_unique;

ALTER TABLE films
ADD CONSTRAINT title_length
CHECK (length(title) >=1);

INSERT INTO films 
       VALUES ('');

ALTER TABLE films
DROP CONSTRAINT title_length;

ALTER TABLE films
ADD CONSTRAINT year_range
CHECK (year BETWEEN 1900 AND 2100);

ALTER TABLE films
ADD CONSTRAINT director_name
CHECK (length(director) >= 3 AND position(' ' in director) > 0);

UPDATE films
SET director = 'Johnny'
WHERE title = 'Die Hard';
