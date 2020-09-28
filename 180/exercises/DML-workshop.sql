CREATE TABLE devices (
  PRIMARY KEY(id),
  id         SERIAL,
  name       text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parts (
  PRIMARY KEY (id),
  id          SERIAL,
  part_number INT UNIQUE NOT NULL,
  device_id   INT REFERENCES devices (id)
);

INSERT INTO devices (name)
       VALUES ('Accelerometer'), ('Gyroscope');


INSERT INTO parts (part_number, device_id)
       VALUES (20, 1), (21, 1), (22, 1),
              (30, 2), (31, 2), (32, 2), (33, 2), (34, 2);

INSERT INTO parts (part_number)
       VALUES (50), (54), (58);

SELECT devices.name, parts.part_number
  FROM devices
  JOIN parts 
    ON devices.id = parts.device_id;

SELECT *
  FROM parts
 WHERE part_number::text LIKE '3%';

SELECT devices.name, count(parts.device_id)
  FROM devices
  LEFT OUTER JOIN parts 
    ON devices.id = parts.device_id
 GROUP BY devices.name;

SELECT devices.name, count(parts.device_id)
  FROM devices
  LEFT OUTER JOIN parts 
    ON devices.id = parts.device_id
 GROUP BY devices.name
 ORDER BY count DESC;


SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NOT NULL;

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NULL;

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

SELECT name AS oldest_device
  FROM devices
 ORDER BY created_at
 LIMIT 1;

UPDATE parts
SET device_id = 1
WHERE part_number=33 OR part_number=32;


UPDATE parts
SET device_id = 1
WHERE part_number = (SELECT min(part_number) FROM parts);

DELETE 
FROM   devices
WHERE  id = 1;


DELETE 
FROM   parts
WHERE  device_id = 1;
