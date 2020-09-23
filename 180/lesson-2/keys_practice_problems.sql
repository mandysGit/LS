/* auto-incrementing integer primary key */
ALTER TABLE films
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE films
DROP CONSTRAINT films_pkey;
