CREATE DATABASE Catalog

CREATE TABLE genre(
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  item_id INT REFERENCES items(id)
);

CREATE TABLE MusicAlbum(
  id  INT NOT NULL PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE
);