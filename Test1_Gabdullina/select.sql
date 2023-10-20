SELECT * FROM Artists;

SELECT Songs.song_title, Songs.duration, Artists.artist_name
FROM Songs
JOIN Albums ON Songs.album_id = Albums.album_id
JOIN Artists ON Albums.artist_id = Artists.artist_id
WHERE Albums.album_title = 'Nanoka';

SELECT song_title, duration
FROM Songs
JOIN Albums ON Songs.album_id = Albums.album_id
WHERE Albums.genre = 'Pop'
ORDER BY duration;

SELECT Artists.artist_name, AVG(Songs.duration) AS avg_duration
FROM Songs
JOIN Albums ON Songs.album_id = Albums.album_id
JOIN Artists ON Albums.artist_id = Artists.artist_id
GROUP BY Artists.artist_name;

SELECT album_title, release_date
FROM Albums
ORDER BY release_date
LIMIT 3;