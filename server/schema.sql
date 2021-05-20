CREATE DATABASE chat;

USE chat;

DROP TABLE IF EXISTS `messages`;

/* Describe your table here.*/
CREATE TABLE messages (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  id_user INT NOT NULL,
  id_room INT NOT NULL,
  time_stamp DATETIME NOT NULL,
  message_text MEDIUMTEXT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_user) REFERENCES users (id),
  FOREIGN KEY (id_room) REFERENCES rooms (id)
);

/*
CREATE TABLE `messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` INTEGER NOT NULL,
  `room_id` INT NOT NULL,
  `time_stamp` DATETIME NULL,
  `message_text` MEDIUMTEXT NULL DEFAULT NULL,
  `id_users` INT NOT NULL DEFAULT NULL,
  `id_rooms` INT NOT NULL,
  PRIMARY KEY (`id`)
);
*/
DROP TABLE IF EXISTS `users`;

/* Create other tables and define schemas for them here! */
CREATE TABLE users (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  username VARCHAR(110) NOT NULL,
  PRIMARY KEY (id)
);

/*
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `username` VARCHAR(110) NOT NULL,
  PRIMARY KEY (`id`)
);
*/

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE rooms (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  room_name VARCHAR(110) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

/*
CREATE TABLE `rooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `room_name` VARCHAR(110) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);
*/

DROP TABLE IF EXISTS `room_subscriptions`;

CREATE TABLE room_subscriptions (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  id_user INT NOT NULL,
  id_room INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_user) REFERENCES users (id),
  FOREIGN KEY (id_room) REFERENCES rooms (id)
);

/*
CREATE TABLE `room_subscriptions` (
  `id` INT NOT NULL AUTO_INCREMENT DEFAULT 0,
  `user` INTEGER NOT NULL,
  `room_id` INTEGER NULL DEFAULT NULL,
  `id_rooms` INT NOT NULL,
  `id_users` INT NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);
*/

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

