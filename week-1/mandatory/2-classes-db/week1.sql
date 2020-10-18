drop table if exists mentors;
drop table if exists students
drop table if exists classes;
drop table if exists schedule;


CREATE TABLE mentors(
 id	  SERIAL PRIMARY KEY,
 name	  VARCHAR(30) NUT NULL,
 years_in_city     INT,
 address  VARCHAR(100),
 postcode VARCHAR(10),
 favourite_lang  VARCHAR(20) 
); 


CREATE TABLE students(
 id	  SERIAL PRIMARY KEY,
 name     VARCHAR(30) NOT NULL,
 address  VARCHAR(100),
 postcode    VARCHAR(10),
 graduated BOOLEAN NOT NULL
);


CREATE TABLE classes(
 id  SERIAL PRIMARY KEY,
 topic    VARCHAR(30) NOT NULL,
 mentor_id  INT REFERENCES mentors(id),
 date  DATE NOT NULL,
 location  VARCHAR(20),
);


CREATE TABLE schedule(
 id 	SERIAL PRIMARY KEY,
 student_id  INT REFERENCES students(id),
 class_id    INT REFERENCES classes(id)
),


INSERT INTO mentors (name, email, address, postcode, country) VALUES ('John Smith','11 New Road','G10 2AB','CSS');
INSERT INTO mentors (name, email, address, postcode, country) VALUES ('Sue Jones','120 Old Street','G10 3CD','HTML');
INSERT INTO mentors (name, email, address, postcode, country) VALUES ('Alice Evans','3 High Road','G13 4EF','REACT');
INSERT INTO mentors (name, email, address, postcode, country) VALUES ('Mohammed Trungpa','25 Blue Road','G25 6GH','JS');
INSERT INTO mentors (name, email, address, postcode, country) VALUES ('Steven King','19 Bed Street','G50 3AC','JAVA');






