CREATE TABLE customers (
  PRIMARY KEY(id),
  id            SERIAL,
  name          text NOT NULL,
  payment_token CHAR(8) NOT NULL UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  PRIMARY KEY(id),
  id          SERIAL,
  description text NOT NULL,
  price       NUMERIC(10, 2) NOT NULL CHECK(price >= 0.00)
);

INSERT INTO customers (name, payment_token)
       VALUES ('Pat Johnson', 'XHGOAHEQ'),
              ('Nancy Monreal', 'JKWQPJKL'),
              ('Lynn Blake', 'KLZXWEEE'),
              ('Chen Ke-Hua', 'KWETYCVX'),
              ('Scott Lakso', 'UUEAPQPS'),
              ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
       VALUES ('Unix Hosting', 5.95),
              ('DNS', 4.95),
              ('Whois Registration', 1.95),
              ('High Bandwidth', 15.00),
              ('Business Support', 250.00),
              ('Dedicated Hosting', 50.00),
              ('Bulk Email', 250.00),
              ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  PRIMARY KEY (id),
  id SERIAL, 
  customer_id INT 
    REFERENCES customers(id)
    ON DELETE CASCADE
    NOT NULL,
  service_id  INT
    REFERENCES services (id)
    NOT NULL,
  UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services(customer_id, service_id)
  VALUES
  (1, 1), (1, 2), (1, 3),
  (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
  (4, 1), (4, 4), 
  (5, 1), (5, 2), (5, 6),
  (6, 1), (6, 6), (6, 7);


SELECT DISTINCT customers.* 
  FROM customers
  JOIN customers_services ON customers_services.customer_id = customers.id;


SELECT DISTINCT customers.* 
  FROM customers
      LEFT OUTER JOIN customers_services 
      ON customers_services.customer_id = customers.id
  WHERE customers_services.customer_id IS NULL;

SELECT s.description
  FROM customers_services AS cs
 RIGHT OUTER JOIN services AS s
    ON s.id = cs.service_id
  WHERE cs.service_id IS NULL;
