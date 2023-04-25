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
