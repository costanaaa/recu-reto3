SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS tienda
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'admin_ciber'@'localhost' IDENTIFIED BY 'ByronLove$';

GRANT SELECT, INSERT, UPDATE, DELETE
ON tienda.*
TO 'admin_ciber'@'localhost'
WITH GRANT OPTION;

FLUSH PRIVILEGES;

USE tienda;

DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS usuario;

CREATE TABLE producto (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  precio DECIMAL(6,2) NOT NULL,
  imagen VARCHAR(255) NOT NULL DEFAULT 'img/default.png',
  categoria VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO producto (id, nombre, descripcion, precio, imagen, categoria) VALUES
(1, 'Proteina Whey 1kg', 'Sabor a vainilla\n13g de BCAA por serving', 34.99, 'img/1769686688_f2113c4286d7.png', 'Proteína');

CREATE TABLE usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(80) NOT NULL,
  email VARCHAR(80) NOT NULL,
  user VARCHAR(20) NOT NULL,
  password VARCHAR(40) NOT NULL,
  rol ENUM('admin','user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (id),
  UNIQUE KEY uq_user (user),
  UNIQUE KEY uq_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO usuario (id, nombre, apellidos, email, user, password, rol) VALUES
(1, 'Aimar', 'Costana Irazola', 'aimar.costana@maristak.net', 'costix', 'ramon1234', 'admin'),
(2, 'Ramon', 'Payo Payez', 'ramon@gmail.com', 'ramon', '1234567890', 'user');

COMMIT;
