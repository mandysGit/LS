CREATE TABLE people (
  name       VARCHAR(255),
  age        INTEGER,
  occupation VARCHAR(255)
);

INSERT INTO people (name, age, occupation)
  VALUES ('Abby', 34, 'biologist'),
         ('Mu''nisah', 26, NULL),
         ('Mirabelle', 40, 'contractor')
;

SELECT    *
   FROM   people
   WHERE  name = 'Mu''nisah';

SELECT    *
   FROM   people
   WHERE  age = 26;

SELECT    *
   FROM   people
   WHERE  occupation IS NULL;

 
CREATE TABLE birds (
  name     VARCHAR(255),
  length   NUMERIC(4,1),
  wingspan NUMERIC(4,1),
  family   VARCHAR(255),
  extinct  BOOLEAN
);


INSERT INTO birds (name, length, wingspan, family, extinct)
  VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
         ('American Robin', 25.5, 36.0, 'Turdidae', false),
         ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
         ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
         ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);


SELECT   name, family
  FROM   birds
 WHERE   extinct = true
ORDER BY length DESC;


SELECT round(avg(wingspan), 1) as round, min(wingspan) AS min, max(wingspan) as max
FROM birds;


CREATE TABLE menu_items (
  item            TEXT,
  prep_time       INTEGER,
  ingredient_cost NUMERIC(3, 2),
  sales           INTEGER,
  menu_price      NUMERIC(3, 2)
);

INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price)
  VALUES ('omelette', 10, 1.50, 182, 7.99),
         ('tacos', 5, 2.00, 254, 8.99),
         ('oatmeal', 1, 0.50, 79, 5.99);

SELECT    item, (menu_price - ingredient_cost) AS profit
    FROM  menu_items
ORDER BY  profit DESC
   LIMIT  1;


SELECT   item, menu_price,
         ingredient_cost, round(prep_time/60.0 * 13.0, 2) AS labor,
         menu_price - ingredient_cost - round(prep_time/60.0 * 13.0, 2) AS profit
    FROM menu_items
ORDER BY profit DESC;
