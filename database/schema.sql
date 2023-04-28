CREATE DATABASE Catalog

CREATE TABLE SOURCES (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
);

CREATE TABLE GENRE(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  name VARCHAR(255),
);

CREATE TABLE AUTHORS(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
);

CREATE TABLE LABELS(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255),
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

CREATE TABLE MUSICALBUMS(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT fk_musicalbum_genre FOREIGN KEY (genre_id) REFERENCES GENRES(id),
  CONSTRAINT fk_musicalbum_source FOREIGN KEY (source_id) REFERENCES SOURCES(id),
  CONSTRAINT fk_musicalbum_author FOREIGN KEY (author_id) REFERENCES AUTHORS(id),
  CONSTRAINT fk_musicalbum_label FOREIGN KEY (label_id) REFERENCES LABELS(id),
);


CREATE TABLE BOOKS(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT fk_book_genre FOREIGN KEY (genre_id) REFERENCES GENRES(id),
  CONSTRAINT fk_book_source FOREIGN KEY (source_id) REFERENCES SOURCES(id),
  CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES AUTHORS(id),
  CONSTRAINT fk_book_label FOREIGN KEY (label_id) REFERENCES LABELS(id),
);

CREATE TABLE GAMES(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT fk_game_genre FOREIGN KEY (genre_id) REFERENCES GENRES(id),
  CONSTRAINT fk_game_source FOREIGN KEY (source_id) REFERENCES SOURCES(id),
  CONSTRAINT fk_game_author FOREIGN KEY (author_id) REFERENCES AUTHORS(id),
  CONSTRAINT fk_game_label FOREIGN KEY (label_id) REFERENCES LABELS(id),
);
