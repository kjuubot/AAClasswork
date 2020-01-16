PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL, 
  body TEXT NOT NULL,

  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE question_likes (
  liked INT NOT NULL,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

INSERT INTO
  users (fname, lname)
VALUES
  ('Andy', 'Tran'),
  ('Joanna', 'Jao'),
  ('John', 'Doe');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('SQL question', 'What is sql?', (SELECT users.id FROM users WHERE fname = 'Andy' AND lname = 'Tran')),
  ('Ruby question', 'What is Ruby?', (SELECT users.id FROM users WHERE fname = 'Joanna' AND lname = 'Jao')),
  ('More SQL', '2x What is sql?', (SELECT users.id FROM users WHERE fname = 'Andy' AND lname = 'Tran')),
  ('More Ruby', '2x What is Ruby?', (SELECT users.id FROM users WHERE fname = 'Joanna' AND lname = 'Jao'));


INSERT INTO
  questions_follows(user_id, question_id)
VALUES
  ((SELECT users.id FROM users WHERE fname = 'Joanna' AND lname = 'Jao'), 1),
  ((SELECT users.id FROM users WHERE fname = 'Andy' AND lname = 'Tran'), 2),
  ((SELECT users.id FROM users WHERE fname = 'Joanna' AND lname = 'Jao'), 3),
  ((SELECT users.id FROM users WHERE fname = 'Andy' AND lname = 'Tran'), 4);

INSERT INTO
  replies(subject_id, user_id, parent_id, body)
VALUES
  (1,1,NULL,'SQL is idk'),
  (2,1, NULL, 'IDK'),
  (3,2, NULL, 'Same question IDK'),
  (1,2,1, 'ive seen this before'),
  (1,1,2, 'ive seen this before');


INSERT INTO
  question_likes(liked, user_id, question_id)
VALUES
  (1,1,1),
  (1,1,2),
  (1,1,4),
  (0,1,3),
  (0,2,1),
  (0,2,2),
  (1,2,3),
  (1,2,4);
