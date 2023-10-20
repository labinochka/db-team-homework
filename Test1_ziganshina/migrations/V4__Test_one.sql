create table Libraries (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(100),
    establishment_date DATE,
    UNIQUE (name)
);

create table Books (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    publication_date DATE,
    genre VARCHAR(50),
    total_copies INT CHECK (total_copies >= 0),
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES Libraries(id),
    UNIQUE (title, author)
);

create table Readers (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    UNIQUE (email, phone_number)
);

create table BookRentals (
    id BIGSERIAL PRIMARY KEY,
    reader_id INT,
    book_id INT,
    rental_date DATE,
    due_date DATE,
    returned_date DATE,
    FOREIGN KEY (reader_id) REFERENCES Readers(id),
    FOREIGN KEY (book_id) REFERENCES Books(id),
    CHECK (returned_date IS NULL OR returned_date <= due_date)
);


insert into Libraries (name, location, establishment_date)
values
    ('Центральная библиотека', 'Нью-Йорк', '2000-01-15'),
    ('Городская библиотека', 'Лос-Анджелес', '1995-07-20'),
    ('Муниципальная библиотека', 'Чикаго', '2002-03-10'),
    ('Национальная библиотека', 'Москва', '1992-05-18'),
    ('Библиотека Российской академии наук', 'Санкт-Петербург', '1841-02-08');

insert into Books (title, author, publication_date, genre, total_copies, library_id)
values
    ('Война и мир', 'Лев Толстой', '1869-01-01', 'Роман', 10, 1),
    ('1984', 'Джордж Оруэлл', '1949-06-08', 'Фантастика', 5, 2),
    ('Гарри Поттер и философский камень', 'Джоан Роулинг', '1997-06-26', 'Фэнтези', 8, 1),
    ('Преступление и наказание', 'Федор Достоевский', '1866-01-01', 'Роман', 7, 3),
    ('Властелин колец', 'Дж. Р. Р. Толкиен', '1954-07-29', 'Фэнтези', 6, 4);

insert into Readers (first_name, last_name, date_of_birth, email, phone_number)
values
    ('Иван', 'Иванов', '1985-03-15', 'ivan@gmail.com', '+1234567890'),
    ('Елена', 'Петрова', '1990-08-20', 'elena@yandex.ru', '+9876543210'),
    ('Алексей', 'Сидоров', '1978-12-10', 'alex@mail.ru', '+5555555555'),
    ('Ольга', 'Козлова', '1982-05-05', 'olga@gmail.com', '+1111111111'),
    ('Дмитрий', 'Морозов', '1995-11-30', 'dmitry@yandex.ru', '+9999999999');

insert into BookRentals (reader_id, book_id, rental_date, due_date)
values
    (1, 1, '2023-04-01', '2023-04-15'),
    (2, 2, '2023-04-02', '2023-04-16'),
    (3, 3, '2023-04-03', '2023-04-17'),
    (4, 4, '2023-04-04', '2023-04-18'),
    (5, 5, '2023-04-05', '2023-04-19');
