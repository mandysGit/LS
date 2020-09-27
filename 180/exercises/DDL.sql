CREATE TABLE stars (
  PRIMARY KEY (id),
  id            SERIAL,
  name          VARCHAR(25) UNIQUE NOT NULL,
  distance      INT NOT NULL CONSTRAINT positive_distance CHECK (distance > 0),
  spectral_type CHAR(1),
  companions    INT NOT NULL CONSTRAINT positive_companions CHECK (companions >= 0)
);

CREATE TABLE planets (
  PRIMARY KEY (id),
  id          SERIAL,
  designation CHAR(1),
  mass        INT
);


ALTER TABLE planets
ADD COLUMN star_id INT NOT NULL REFERENCES stars (id);

ALTER TABLE planets
ALTER COLUMN name TYPE VARCHAR(50);
