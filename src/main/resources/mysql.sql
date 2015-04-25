CREATE DATABASE IF NOT EXISTS webapp_template
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE webapp_template;

CREATE TABLE IF NOT EXISTS users
(
  username   VARCHAR(20) PRIMARY KEY,
  password   VARCHAR(20) NOT NULL,
  fullname   VARCHAR(20) NOT NULL,
  created_at DATETIME    NOT NULL
);

CREATE TABLE IF NOT EXISTS posts
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  title      VARCHAR(128)   NOT NULL,
  content    VARCHAR(16384) NULL,
  username   VARCHAR(20)    NOT NULL,
  created_at DATETIME       NOT NULL,
  updated_at DATETIME       NOT NULL,
  FOREIGN KEY (username) REFERENCES users (username)
);