INSERT INTO calls ("when", duration, contact_id)
       VALUES ('2016-01-18 14:47:00', 632, 6);

SELECT  calls."when", calls.duration, contacts.first_name
  FROM  calls
  INNER JOIN contacts ON calls.contact_id = contacts.id
  WHERE contacts.first_name != 'William' AND contacts.last_name != 'Swift';

INSERT INTO contacts (first_name, last_name, number)
       VALUES ('Merve', 'Elk', '6343511126'),
              ('Sawa', 'Fyodorov', '6125594874');

INSERT INTO calls ("when", duration, contact_id)
       VALUES ('2016-01-17 11:52:00', 175, 26),
              ('2016-01-18 21:22:00', 79, 27);

ALTER TABLE contacts
ADD CONSTRAINT number_unique UNIQUE (number);

INSERT INTO contacts (first_name, last_name, number) VALUES ('test', 'test', 6125594874);
