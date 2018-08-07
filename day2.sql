
-- DAY 2
-- ===============

CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR NOT NULL,
  body BLOB NOT NULL,
  authors_id INTEGER,
  timestamp DATE DEFAULT (datetime('now','localtime')),

  FOREIGN KEY(authors_id) REFERENCES authors(id)
);

CREATE TABLE authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(500) NOT NULL
);

INSERT INTO authors (name) VALUES  ("Han Solo");
INSERT INTO authors (name) VALUES  ("Princess Leia");
INSERT INTO authors (name) VALUES  ("C3PO");
INSERT INTO authors (name) VALUES  ("Darth Vader");
INSERT INTO authors (name) VALUES  ("Yoda");
INSERT INTO authors (name) VALUES  ("Obi Wan Kenobi");
INSERT INTO authors (name) VALUES  ("Luke Skywalker");

INSERT INTO notes (title, body, authors_id) VALUES ("How to jump to light speed", "Push the lightspeed button", 1);
INSERT INTO notes (title, body, authors_id) VALUES ("To Chewbacca", "Laugh it up fuzzball!", 1);
INSERT INTO notes (title, body, authors_id) VALUES ("Help me!", "Where the heck are you Obi Wan!", 2);
INSERT INTO notes (title, body, authors_id) VALUES ("Oh dear!", "Where is R2!!!!", 3);
INSERT INTO notes (title, body, authors_id) VALUES ("Who am I?", "I am your father!", 4);
INSERT INTO notes (title, body, authors_id) VALUES ("Don't try", "there is only do or do not!", 5);
INSERT INTO notes (title, body, authors_id) VALUES ("Don't strike me", "Or I'll come back stronger", 6);
INSERT INTO notes (title, body, authors_id) VALUES ("If you ask me", "I should have just stayed in Tatooine", 7);

SELECT * FROM notes WHERE name = "Han Solo";

SElECT * FROM notes JOIN authors WHERE notes.authors_id = authors.id AND name = 'Han Solo';

SELECT authors.name FROM notes JOIN authors WHERE notes.authors_id = authors.id AND notes.id = 3;

DELETE FROM authors WHERE name = 'Han Solo';
SELECT authors.name, COUNT(*) as num_of_notes FROM notes JOIN authors WHERE notes.authors_id = authors.id GROUP BY authors.name;

