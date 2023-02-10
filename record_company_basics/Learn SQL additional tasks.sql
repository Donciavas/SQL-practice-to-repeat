USE record_company;

#Select only the Names of all the Bands
SELECT bands.name AS 'Band Name'
FROM bands;

#Select the Oldest Album
SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1; #Select the Oldest Album (order by then take one record from the top)

#Get all Bands that have Albums
SELECT DISTINCT bands.name AS 'Band Name' 
FROM bands
JOIN albums ON albums.band_id = bands.id;

#Get all Bands that have No Albums
SELECT DISTINCT bands.name AS 'Band Name' 
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.band_id is NULL;

#Get all Bands that have No Albums
SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY bands.id
HAVING COUNT(albums.id) = 0;

#Get the Longest Album
SELECT albums.name AS 'Name', albums.release_year AS 'Release Year', SUM(songs.length) AS 'Duration'
FROM albums
JOIN songs ON songs.album_id = albums.id
GROUP BY songs.album_id
ORDER BY Duration DESC
LIMIT 1;

#Update the Release Year of the Album with no Release Year
/* This is the query used to get the id */
/*
  SELECT * FROM albums where release_year IS NULL;
*/
UPDATE albums
SET release_year = 1986
WHERE id = 4;

#Insert a record for your favorite Band and one of their Albums
INSERT INTO bands (name)
VALUES ('Favorite Band Name');

/* This is the query used to get the band id of the band just added */
/*
  SELECT id FROM bands
  ORDER BY id DESC LIMIT 1;
*/

INSERT INTO albums (name, release_year, band_id)
VALUES ('Favorite Album Name', 2000, 8);

#Delete the Band and Album you added in #8
/* This is the query used to get the album id of the album added in #8 */
/*
  SELECT id FROM albums
  ORDER BY id DESC LIMIT 1;
*/

DELETE FROM albums
WHERE id = 24;

/* This is the query used to get the band id of the band added in #8 */
/*
  SELECT id FROM bands
  ORDER BY id DESC LIMIT 1;
*/

DELETE FROM bands
WHERE id = 8;

#Get the Average Length of all Songs
SELECT AVG(songs.length) AS 'Average Song Duration'
FROM songs;

#Select the longest Song off each Album
SELECT
  albums.name AS 'Album',
  albums.release_year AS 'Release Year',
  MAX(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id;

#Get the number of Songs for each Band
SELECT
  bands.name AS 'Band',
  COUNT(songs.id) AS 'Number of Songs'
FROM bands
JOIN albums ON bands.id = albums.band_id
JOIN songs ON albums.id = songs.album_id
GROUP BY albums.band_id;

#Shows table how it looks
DESCRIBE albums;

#Trigger to save message when new band is added
DELIMITER $$
CREATE
	TRIGGER new_band_trigger BEFORE INSERT
    ON bands
    FOR EACH ROW BEGIN
		INSERT INTO trigger_message VALUES('New Band is added: ', NEW.name, NULL);
        END$$
DELIMITER ;

INSERT INTO bands(name)
VALUES('Super Band');

SELECT * FROM bands;
SELECT * FROM trigger_message;

/*
#Trigger to save name when new band is added
DELIMITER $$
CREATE
	TRIGGER new_band_trigger1 BEFORE INSERT
    ON bands
    FOR EACH ROW BEGIN
		INSERT INTO trigger_message VALUES(NULL, NEW.name, NULL);
        END$$
DELIMITER ;
*/

#Trigger to save message when band is deleted
DELIMITER $$
CREATE
	TRIGGER delete_band_trigger BEFORE DELETE
    ON bands
    FOR EACH ROW BEGIN
		INSERT INTO trigger_message VALUES('Band is deleted: ', OLD.name, NULL);
        END$$
DELIMITER ;

SELECT * FROM bands;
SELECT * FROM trigger_message;

DELETE FROM bands
WHERE id = 17;

#Trigger before update example
DELIMITER $$
CREATE TRIGGER before_song_length_update_trigger
BEFORE UPDATE
ON songs FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('The new length ',
                        NEW.length,
                        ' cannot be 3 times greater than the current length ',
                        OLD.length);
                        
    IF new.length > old.length * 3 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$
DELIMITER ;

#Trigger after update example
DELIMITER $$
CREATE
	TRIGGER after_song_length_update_trigger AFTER UPDATE
    ON songs
    FOR EACH ROW BEGIN
		INSERT INTO trigger_message VALUES('Song length is Updated: ', NEW.name, OLD.length);
        END$$
DELIMITER ;

INSERT INTO bands(name)
VALUES('Super Band');

UPDATE songs
SET length = 1.5
WHERE id = 1;

SELECT * FROM bands;
SELECT * FROM trigger_message;
SELECT * FROM songs;

DELETE FROM bands
WHERE id = 18;

DROP TRIGGER new_band_triggerX;
