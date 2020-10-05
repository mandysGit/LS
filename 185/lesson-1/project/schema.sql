CREATE TABLE expenses (
  id         SERIAL PRIMARY KEY,
  amount     NUMERIC(6,2) NOT NULL,
  memo       text NOT NULL,
  created_on date NOT NULL
);
