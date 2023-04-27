CREATE DATABASE Catalog

CREATE TABLE genre(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255),
   FOREIGN KEY(item_id) REFERENCES items(id)
);

CREATE TABLE MusicAlbum(
  id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE
);

CREATE TABLE [Item](
	[id] [int] GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	[genre] [int] ,
	[author] [int] ,
	[source] [int] ,
	[label] [int] ,
	[publishdate] [date] ,
	[archived] [BOOLEAN] ,
);

ALTER TABLE [Item]  WITH CHECK ADD CONSTRAINT [FK_Item_Genre] FOREIGN KEY([genre])
REFERENCES [Genre] ([id])
ALTER TABLE [Item] CHECK CONSTRAINT [FK_Item_Genre]

CREATE TABLE SOURCES (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
);

CREATE TABLE MOVIES (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  publish_date DATE NOT NULL,
  silent BOOLEAN NOT NULL,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT fk_movies_genre FOREIGN KEY (genre_id) REFERENCES GENRES(id),
  CONSTRAINT fk_movies_source FOREIGN KEY (source_id) REFERENCES SOURCES(id),
  CONSTRAINT fk_movies_author FOREIGN KEY (author_id) REFERENCES AUTHORS(id),
  CONSTRAINT fk_movies_label FOREIGN KEY (label_id) REFERENCES LABELS(id),
);

CREATE TABLE AUTHORS (
	id INT GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
)

CREATE TABLE GAMES (
	id INT GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  multiplayer VARCHAR(10) NOT NULL,
  last_played_at DATE NOT NULL,
  publish_date DATE NOT NULL,
	genre_id INT,
	author_id INT,
	source_id INT,
	label_id INT,
	archived BOOLEAN,
  CONSTRAINT fk_movies_genre FOREIGN KEY (genre_id) REFERENCES GENRES(id),
  CONSTRAINT fk_movies_source FOREIGN KEY (source_id) REFERENCES SOURCES(id),
  CONSTRAINT fk_movies_author FOREIGN KEY (author_id) REFERENCES AUTHORS(id),
  CONSTRAINT fk_movies_label FOREIGN KEY (label_id) REFERENCES LABELS(id),
);
