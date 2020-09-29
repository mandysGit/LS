SELECT b.id, b.author, string_agg(c.name, ', ') AS categories
  FROM books b
       INNER JOIN books_categories AS bc
       ON bc.book_id = b.id
       INNER JOIN categories AS c
       ON bc.category_id = c.id
  GROUP BY b.id ORDER BY b.id;

ALTER TABLE books
ALTER COLUMN title TYPE text;

INSERT INTO books (title, author)
       VALUES ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
              ('Jane Eyre', 'Charlotte Brontë'),
              ('Vij''s: Elegant and Inspired Indian Cuisine','Meeru Dhalwala and Vikram Vij');

INSERT INTO categories (name)
            VALUES ('Space Exploration'), ('Cookbook'), ('South Asia');

INSERT INTO books_categories(book_id, category_id)
       VALUES (4,5), (4,1), (4,7),
              (5,2), (5,4), 
              (6,8), (6,1), (6,9);

ALTER TABLE books_categories ADD UNIQUE (book_id, category_id);

SELECT c.name, count(b.id), string_agg(b.title, ', ') 
  FROM books b
       INNER JOIN books_categories AS bc
       ON bc.book_id = b.id
       INNER JOIN categories AS c
       ON bc.category_id = c.id
  GROUP BY name
  ORDER BY name;
