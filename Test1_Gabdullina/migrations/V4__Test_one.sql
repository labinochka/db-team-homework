CREATE TABLE Artists (
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(100) NOT NULL,
  genre VARCHAR(50),
  country VARCHAR(50),
  website_url VARCHAR(200),
  bio TEXT
);
CREATE TABLE Songs (
  song_id INT PRIMARY KEY,
  song_title VARCHAR(100) NOT NULL,
  album_id INT,
  duration TIME,
  lyrics TEXT,
  FOREIGN KEY (album_id) REFERENCES Albums(album_id),
  CHECK (duration >= '00:00:00')
);

CREATE TABLE Albums (
  album_id INT PRIMARY KEY,
  album_title VARCHAR(100) NOT NULL,
  release_date DATE,
  artist_id INT,
  genre VARCHAR(50),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
  UNIQUE (album_title, artist_id)
);
INSERT INTO Artists (artist_id, artist_name, genre, country, website_url, bio)
VALUES
  (1, 'ALiya', 'Pop', 'Russia', 'http://www.aliya.com', 'some facts'),
  (2, 'Nastya', 'Rock', 'Russia', 'http://www.nastya.com', 'some facts'),
  (3, 'Kamila', 'R&B', 'Russia', 'http://www.kamila.com', 'some facts'),
  (4, 'Salavat', 'Latin', 'Russia', 'http://www.salavat.com', 'some facts'),
  (5, 'Valya', 'Country', 'Russia', 'http://www.valya.com', 'some facts');

INSERT INTO Albums (album_id, album_title, release_date, artist_id, genre)
VALUES
  (1, 'Nanoka', '2022-01-01', 1, 'Pop'),
  (2, 'Aimai', '2021-05-15', 2, 'Rock'),
  (3, 'Urs', '2022-09-30', 3, 'R&B'),
  (4, 'Heartbeat', '2020-11-20', 4, 'Latin'),
  (5, 'These days', '2023-03-10', 5, 'Country');

INSERT INTO Songs (song_id, song_title, album_id, duration, lyrics)
VALUES
  (1, 'thank u ', 1, '00:04:30', 'some lyrics'),
  (2, 'stay', 2, '00:03:45', 'some lyrics'),
  (3, 'happy end', 3, '00:05:20', 'some lyrics'),
  (4, 'outside', 4, '00:03:55', 'some lyrics'),
  (5, 'ozin', 5, '00:03:15', 'some lyrics');


