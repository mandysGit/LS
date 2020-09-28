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

ALTER TABLE stars 
ALTER COLUMN distance TYPE NUMERIC;

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectral as ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
ALTER COLUMN spectral_type TYPE spectral
                           USING spectral_type::spectral;

ALTER TABLE planets
ALTER COLUMN mass TYPE NUMERIC,
ALTER COLUMN mass SET NOT NULL,
ADD CHECK (mass > 0.0),
ALTER COLUMN designation SET NOT NULL;

ALTER TABLE planets
ADD COLUMN semi_major_axis NUMERIC NOT NULL;

CREATE TABLE moons (
  PRIMARY KEY (id),
  id              SERIAL,
  designation     INT NOT NULL CHECK (designation > 0),
  semi_major_axis NUMERIC CHECK (semi_major_axis > 0),
  mass            NUMERIC CHECK (mass > 0),
  planet_id       INT NOT NULL REFERENCES planets (id)
);
