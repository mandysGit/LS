CREATE TABLE customers (
    id            SERIAL PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE email_addresses (
    customer_id  INT PRIMARY KEY,
    email        VARCHAR(100),
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE
);

INSERT INTO customers (customer_name)
VALUES ('James Bergman'),
  ('Natasha O''Shea'),
  ('Aaron Muller');

INSERT INTO email_addresses (customer_id, email)
  VALUES (1, 'james1998@email.com'),
    (2, 'natasha@osheafamily.com');
