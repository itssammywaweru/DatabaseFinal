-- Create the database
CREATE DATABASE IF NOT EXISTS movie_db;
USE movie_db;

-- Table: Directors
CREATE TABLE Directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Actors
CREATE TABLE Actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Genres
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

-- Table: Movies
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year YEAR NOT NULL,
    genre_id INT,
    director_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
        ON DELETE SET NULL,
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
        ON DELETE SET NULL
);

-- Table: Movie_Actor (many-to-many between Movies and Actors)
CREATE TABLE Movie_Actor (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
        ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
        ON DELETE CASCADE
);

-- Insert Genres
INSERT INTO Genres (genre_name) VALUES
('Sci-Fi'),
('Drama'),
('Action'),
('Romance'),
('Thriller');

-- Insert Directors
INSERT INTO Directors (name) VALUES
('Christopher Nolan'),
('James Cameron'),
('Steven Spielberg');

-- Insert Actors
INSERT INTO Actors (name) VALUES
('Leonardo DiCaprio'),
('Kate Winslet'),
('Joseph Gordon-Levitt'),
('Tom Hardy'),
('Sam Worthington'),
('Zoe Saldana'),
('Tom Hanks');

-- Insert Movies
INSERT INTO Movies (title, release_year, genre_id, director_id) VALUES
('Inception', 2010,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Christopher Nolan')),
('Titanic', 1997,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Romance'),
    (SELECT director_id FROM Directors WHERE name = 'James Cameron')),
('Avatar', 2009,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'James Cameron')),
('Saving Private Ryan', 1998,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'Steven Spielberg'));

-- Insert Movie_Actor (who acted in what movie)
-- Inception: Leonardo, Joseph, Tom Hardy
INSERT INTO Movie_Actor (movie_id, actor_id) VALUES
((SELECT movie_id FROM Movies WHERE title = 'Inception'),
 (SELECT actor_id FROM Actors WHERE name = 'Leonardo DiCaprio')),
((SELECT movie_id FROM Movies WHERE title = 'Inception'),
 (SELECT actor_id FROM Actors WHERE name = 'Joseph Gordon-Levitt')),
((SELECT movie_id FROM Movies WHERE title = 'Inception'),
 (SELECT actor_id FROM Actors WHERE name = 'Tom Hardy'));

-- Titanic: Leonardo, Kate
INSERT INTO Movie_Actor (movie_id, actor_id) VALUES
((SELECT movie_id FROM Movies WHERE title = 'Titanic'),
 (SELECT actor_id FROM Actors WHERE name = 'Leonardo DiCaprio')),
((SELECT movie_id FROM Movies WHERE title = 'Titanic'),
 (SELECT actor_id FROM Actors WHERE name = 'Kate Winslet'));

-- Avatar: Sam Worthington, Zoe Saldana
INSERT INTO Movie_Actor (movie_id, actor_id) VALUES
((SELECT movie_id FROM Movies WHERE title = 'Avatar'),
 (SELECT actor_id FROM Actors WHERE name = 'Sam Worthington')),
((SELECT movie_id FROM Movies WHERE title = 'Avatar'),
 (SELECT actor_id FROM Actors WHERE name = 'Zoe Saldana'));

-- Saving Private Ryan: Tom Hanks
INSERT INTO Movie_Actor (movie_id, actor_id) VALUES
((SELECT movie_id FROM Movies WHERE title = 'Saving Private Ryan'),
 (SELECT actor_id FROM Actors WHERE name = 'Tom Hanks'));



