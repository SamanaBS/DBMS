CREATE DATABASE movie_DB;
DROP DATABASE hospital;
SHOW DATABASES;
USE movie_DB;
CREATE TABLE actor
(
actor_id int primary key,
actor_fname varchar(45) NOT NULL,
actor_lname varchar(45) NOT NULL,
actor_gender char(10) NOT NULL,
actor_DOB int NOT NULL
);

CREATE TABLE movie_cast
AS (SELECT actor_id FROM actor);
DESC movie_cast;

SHOW TABLES;

ALTER TABLE actor
MODIFY actor_DOB char(8);

INSERT INTO actor (actor_id, actor_fname, actor_lname, actor_gender, actor_DOB)
VALUES (1, 'RANBIR', 'KAPOOR', 'MALE', '25-06-85');
INSERT actor
VALUES (2, 'DEEPIKA', 'PADUKONE', 'FEMALE', '05-08-86');
INSERT actor
VALUES (3, 'PARESH', 'RAWAL', 'MALE', '06-09-66');
INSERT actor
VALUES (4, 'AKSHAY', 'KUMAR', 'MALE', '02-03-73');
INSERT actor
VALUES (5, 'RANI', 'MUKHERJI', 'FEMALE', '21-12-80');

SELECT * FROM `actor`;

SELECT actor_fname FROM actor;

SELECT *
FROM actor
WHERE actor_id = 3;

SELECT *
FROM actor
WHERE actor_lname IS NOT NULL;

DROP TABLE movie_cast;

DESC actor;

SELECT actor_fname, actor_lname
FROM actor
WHERE actor_gender = 'female';























