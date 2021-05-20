DROP DATABASE IF EXISTS chat;

CREATE DATABASE chat;

USE chat;

CREATE TABLE users (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE rooms (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  roomname VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE messages (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  id_user INT unsigned NOT NULL,
  id_room INT unsigned NOT NULL,
  time_stamp DATETIME NULL,
  message MEDIUMTEXT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_user) REFERENCES users (id),
  FOREIGN KEY (id_room) REFERENCES rooms (id)
);

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

