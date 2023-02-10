CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY (id)
);
CREATE TABLE albums(
id INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(50) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES bands(id)
);

CREATE TABLE songs (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

ALTER TABLE songs
ADD length FLOAT NOT NULL;

DROP TABLE trigger_message;

CREATE TABLE trigger_message (
	message VARCHAR(255),
    name VARCHAR(100),
    value FLOAT
);