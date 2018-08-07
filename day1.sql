-- DAY 1
-- ===============

PRAGMA foreign_keys = 1;

CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);

CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE track (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128),
  album_id INTEGER,

  FOREIGN KEY(album_id) REFERENCES album(id)
);

CREATE TABLE artist_album (
  album_id INTEGER,
  artist_id INTEGER,

  FOREIGN KEY(album_id) REFERENCES album(id),
  FOREIGN KEY(artist_id) REFERENCES artist(id)
);

-- or:

CREATE TABLE artist_album (
  artist_id INTEGER REFERENCES artist(id),
  album_id INTEGER REFERENCES album(id)
);

SELECT * FROM album;

SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;

SELECT * FROM album WHERE title LIKE 'Super D%';

SELECT * FROM album WHERE release_year IS NULL; 

SELECT track.title from track JOIN album WHERE track.album_id = track.id and album.title = 'Super Funky Album';

SELECT track.title as Track_Title from track JOIN album WHERE track.album_id = track.id and album.title = 'Super Funky Album';

SELECT album.title from (album JOIN artist_album) JOIN artist WHERE album.id = artist_album.album_id AND artist.name = 'Han Solo';

SELECT AVG(release_year) from album;

SELECT AVG(release_year) from (album JOIN artist_album) JOIN artist WHERE album.id = artist_album.album_id AND artist.name = 'Leia and the Ewoks';

SELECT COUNT(*) from artist;

SELECT COUNT(*) from track JOIN album WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';
