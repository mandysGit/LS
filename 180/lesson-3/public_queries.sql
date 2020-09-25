SELECT count(id)
  FROM tickets;

SELECT count( DISTINCT customer_id)
  FROM tickets;

SELECT count(DISTINCT t.customer_id) / count(DISTINCT c.id)::float * 100 AS percent
  FROM tickets AS t
  RIGHT OUTER JOIN customers AS c
    ON c.id = t.customer_id;
    
SELECT events.name, COUNT(tickets.event_id) AS popularity
  FROM events
  LEFT OUTER JOIN tickets
    ON events.id = tickets.event_id
 GROUP BY events.name
 ORDER BY popularity DESC;

SELECT c.id, c.email, COUNT(DISTINCT t.event_id)
  FROM tickets AS t
  INNER JOIN customers AS c
    ON t.customer_id = c.id
 GROUP BY c.id
HAVING count(DISTINCT t.event_id) = 3;

-- Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'.
-- The report should include the event name and starts_at and the seat's section name, row, and seat number.

SELECT events.name, events.starts_at, sections.name, seats.row, seats.number
  FROM events 
  JOIN tickets ON events.id = tickets.event_id
  JOIN customers ON customers.id = tickets.customer_id
  JOIN seats ON seats.id = tickets.seat_id
  JOIN sections on sections.id = seats.section_id
 WHERE customers.email = 'gennaro.rath@mcdermott.co';


