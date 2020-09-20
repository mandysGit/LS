/* exercise 1 */
SELECT countries.name, continents.continent_name
FROM countries
INNER JOIN continents
ON countries.continent_id = continents.id;

/* exercise 2 */
SELECT countries.name, countries.capital
FROM countries
JOIN continents
ON countries.continent_id = continents.id
WHERE continents.continent_name = 'Europe';

/* exercise 3 */
SELECT DISTINCT singers.first_name
FROM singers
JOIN albums
ON albums.singer_id = singers.id
WHERE albums.label = 'Warner Bros';

/* exercise 4 */
SELECT singers.first_name, singers.last_name, albums.album_name, albums.released
FROM singers
JOIN albums
ON albums.singer_id = singers.id
WHERE albums.released >= '1980-01-01'
AND albums.released < '1990-01-01'
AND singers.decreased = false
ORDER BY singers.date_of_birth DESC;

/* exercise 5 */
SELECT singers.first_name, singers.last_name
FROM singers
FULL JOIN albums
ON albums.singer_id = singers.id
WHERE album_name IS NULL;

SELECT singers.first_name, singers.last_name
FROM singers LEFT JOIN albums
ON singers.id = albums.singer_id
WHERE albums.id IS NULL;

/* exercise 6 */
SELECT singers.first_name, singers.last_name
FROM singers
WHERE singers.id
  NOT IN (SELECT albums.singer_id from albums);

/* exercise 7 */
SELECT orders.*, products.*
FROM orders
JOIN order_items ON (order_items.order_id = orders.id)
JOIN products ON (order_items.product_id = products.id);

/* exercise 8 */
SELECT o.id
FROM orders AS o
JOIN order_items AS oi
ON (oi.order_id = o.id)
JOIN products AS p 
ON (oi.product_id = p.id)
WHERE p.product_name = 'Fries';

/* exercise 9 */
SELECT DISTINCT c.customer_name AS "Customers who like Fries"
FROM orders AS o
JOIN order_items AS oi
ON (oi.order_id = o.id)
JOIN products AS p 
ON (oi.product_id = p.id)
JOIN customers AS c
ON (c.id = o.customer_id)
WHERE p.product_name = 'Fries';

/* exercise 10 */
SELECT sum(p.product_cost) AS "Natasha's total order cost"
FROM orders AS o
JOIN order_items AS oi
ON (oi.order_id = o.id)
JOIN products AS p 
ON (oi.product_id = p.id)
JOIN customers AS c
ON (c.id = o.customer_id)
WHERE c.customer_name = 'Natasha O''Shea';

/* exercise 11 */
SELECT count(p.product_name), p.product_name
FROM order_items AS oi
JOIN products AS p 
ON (oi.product_id = p.id)
GROUP BY p.product_name;

