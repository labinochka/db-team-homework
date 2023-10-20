SELECT title, author, publication_date, genre
FROM Books
ORDER BY title
LIMIT 3;

SELECT first_name, last_name, date_of_birth
FROM Readers
WHERE last_name LIKE 'И%' AND date_of_birth > '1990-01-01'
ORDER BY date_of_birth;

SELECT title, publication_date
FROM Books
WHERE author = 'Джордж Оруэлл';

SELECT name, location
FROM Libraries
ORDER BY name;

SELECT genre, COUNT(*) AS book_count
FROM Books
GROUP BY genre;