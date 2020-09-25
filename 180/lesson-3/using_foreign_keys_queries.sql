ALTER TABLE orders
ADD CONSTRAINT order_product_id_fkey
FOREIGN KEY (product_id)
REFERENCES products(id);

INSERT INTO products (name)
       VALUES ('small bolt'),
              ('large bolt');

INSERT INTO orders (product_id, quantity)
       VALUES (1, 10),
              (1, 25),
              (2, 15);

SELECT orders.quantity, products.name
  FROM orders
  JOIN products ON products.id = orders.product_id;

INSERT INTO orders (quantity) VALUES (5);

ALTER TABLE orders
ALTER COLUMN product_id SET NOT NULL;

DELETE FROM orders WHERE id = 4;

ALTER TABLE orders 
ALTER COLUMN product_id
SET NOT NULL;

CREATE TABLE reviews (
  id     SERIAL PRIMARY KEY,
  review TEXT NOT NULL,
  product_id INTEGER REFERENCES products(id)
);

INSERT INTO reviews (product_id, review)
       VALUES (1, 'a little small'),
              (1, 'very round!'),
              (2, 'could have been smaller');
