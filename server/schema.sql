CREATE DATABASE chat;

USE chat;

CREATE TABLE messages (
  /* Describe your table here.*/
  id INT unsigned NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  room_id INT NOT NULL,
  time_stamp Datetime NOT NULL,
  message_text TEXT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (room_id) REFERENCES rooms (id)
);

/* Create other tables and define schemas for them here! */
CREATE TABLE users (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  username VARCHAR(110) NOT NULL,
  fullname VARCHAR(110) NOT NULL,
  email VARCHAR(110) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE rooms (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  room_name VARCHAR(110) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE room_subscriptions (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (room_id) REFERENCES rooms (id)
)

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

