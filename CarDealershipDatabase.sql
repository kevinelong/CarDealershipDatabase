DROP SCHEMA IF EXISTS cardealership;

CREATE SCHEMA cardealership;

USE cardealership; -- make it the default

CREATE TABLE dealerships (
  dealership_id INT AUTO_INCREMENT,
  name VARCHAR(50),
  address VARCHAR(50),
  phone VARCHAR(12),
  PRIMARY KEY (dealership_id)
);
