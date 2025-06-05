-- Database Schema Definition (provided in the prompt)
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

CREATE TABLE vehicles (
  vehicle_id INT AUTO_INCREMENT,
  vin VARCHAR(17),
  make VARCHAR(25),
  model VARCHAR(25),
  year INT,
  color VARCHAR(25),
  PRIMARY KEY (vehicle_id)
);

CREATE TABLE inventory (
  inventory_id INT AUTO_INCREMENT,
  dealership_id INT,
  vin VARCHAR(17),
  PRIMARY KEY (inventory_id)
);

CREATE TABLE sales_contracts (
  sales_contracts_id INT AUTO_INCREMENT,
  customer_name VARCHAR(255),
  dealership_id INT,
  vin VARCHAR(17),
  PRIMARY KEY (sales_contracts_id)
);

CREATE TABLE lease_contracts (
  lease_contracts_id INT AUTO_INCREMENT,
  customer_name VARCHAR(255),
  dealership_id INT,
  vin VARCHAR(17),
  PRIMARY KEY (lease_contracts_id)
);

-- Insert at least 12 rows into dealerships table
INSERT INTO dealerships (name, address, phone) VALUES
('Luxury Autos', '123 Main St', '555-1234'),
('Budget Cars', '456 Oak Ave', '555-5678'),
('City Motors', '789 Pine Ln', '555-9012'),
('Riverside Dealership', '101 River Rd', '555-3456'),
('Hilltop Auto', '222 Summit Blvd', '555-7890'),
('Oceanfront Vehicles', '333 Beach Dr', '555-2109'),
('Desert Motors', '444 Cactus Rd', '555-6543'),
('Forest Green Autos', '555 Woods St', '555-8765'),
('Downtown Deals', '666 Commerce Way', '555-1122'),
('Uptown Cars', '777 Broadway', '555-3344'),
('Suburban Autos', '888 Park Blvd', '555-5566'),
('Countryside Motors', '999 Farm Rd', '555-7788'),
('Express Auto Center', '111 Speedy Ln', '555-9900'),
('Elite Car Sales', '222 Exclusive Ct', '555-0011');

-- Insert at least 12 rows into vehicles table (some provided, adding more)
INSERT INTO vehicles (vin, make, model, year, color) VALUES
('98765432109876543', 'ford', 'mustang', 2015, 'red'),
('56789012345678901', 'chevrolet', 'camaro', 2018, 'blue'),
('21098765432109876', 'honda', 'civic', 2022, 'silver'),
('34567890123456789', 'nissan', 'altima', 2019, 'grey'),
('87654321098765432', 'bmw', '3 series', 2023, 'black'),
('43210987654321098', 'mercedes-benz', 'c-class', 2021, 'white'),
('01234567890123456', 'audi', 'a4', 2024, 'navy'),
('11223344556677889', 'toyota', 'camry', 2020, 'silver'),
('99887766554433221', 'volkswagen', 'golf', 2017, 'blue'),
('13579246801357901', 'subaru', 'outback', 2022, 'green'),
('24680135792468013', 'jeep', 'wrangler', 2023, 'yellow'),
('36914725803691472', 'hyundai', 'elantra', 2021, 'white'),
('08642097531864209', 'kia', 'sportage', 2024, 'red'),
('50505050505050505', 'ford', 'f-150', 2023, 'black'),
('12121212121212121', 'chevrolet', 'silverado', 2022, 'grey');

-- Insert at least 12 rows into inventory table (linking dealerships and vehicles)
INSERT INTO inventory (dealership_id, vin) VALUES
(1, '98765432109876543'), -- Luxury Autos has the 2015 Ford Mustang
(2, '56789012345678901'), -- Budget Cars has the 2018 Chevrolet Camaro
(3, '21098765432109876'), -- City Motors has the 2022 Honda Civic
(1, '87654321098765432'), -- Luxury Autos has the 2023 BMW 3 Series
(2, '43210987654321098'), -- Budget Cars has the 2021 Mercedes-Benz C-Class
(3, '01234567890123456'), -- City Motors has the 2024 Audi A4
(4, '11223344556677889'), -- Riverside Dealership has the 2020 Toyota Camry
(5, '99887766554433221'), -- Hilltop Auto has the 2017 Volkswagen Golf
(6, '13579246801357901'), -- Oceanfront Vehicles has the 2022 Subaru Outback
(7, '24680135792468013'), -- Desert Motors has the 2023 Jeep Wrangler
(8, '36914725803691472'), -- Forest Green Autos has the 2021 Hyundai Elantra
(9, '08642097531864209'), -- Downtown Deals has the 2024 Kia Sportage
(10, '50505050505050505'), -- Uptown Cars has the 2023 Ford F-150
(11, '12121212121212121'); -- Suburban Autos has the 2022 Chevrolet Silverado

-- Insert at least 12 rows into sales_contracts table
INSERT INTO sales_contracts (customer_name, dealership_id, vin) VALUES
('John Doe', 1, '98765432109876543'),
('Jane Smith', 2, '56789012345678901'),
('Peter Jones', 3, '21098765432109876'),
('Mary Brown', 1, '87654321098765432'),
('Robert Garcia', 2, '43210987654321098'),
('Linda Davis', 3, '01234567890123456'),
('Michael Rodriguez', 4, '11223344556677889'),
('Patricia Martinez', 5, '99887766554433221'),
('James Hernandez', 6, '13579246801357901'),
('Jennifer Lopez', 7, '24680135792468013'),
('David Wilson', 8, '36914725803691472'),
('Elizabeth Anderson', 9, '08642097531864209'),
('Charles Thomas', 10, '50505050505050505'),
('Barbara Jackson', 11, '12121212121212121');

-- Insert at least 12 rows into lease_contracts table
INSERT INTO lease_contracts (customer_name, dealership_id, vin) VALUES
('Jessica White', 1, '98765432109876543'),
('Chris Harris', 2, '56789012345678901'),
('Sarah Clark', 3, '21098765432109876'),
('Daniel Lewis', 1, '87654321098765432'),
('Emily Young', 2, '43210987654321098'),
('Matthew Hall', 3, '01234567890123456'),
('Amanda Allen', 4, '11223344556677889'),
('Ryan Scott', 5, '99887766554433221'),
('Stephanie King', 6, '13579246801357901'),
('Justin Green', 7, '24680135792468013'),
('Nicole Adams', 8, '36914725803691472'),
('Brandon Baker', 9, '08642097531864209'),
('Brittany Gonzalez', 10, '50505050505050505'),
('Andrew Carter', 11, '12121212121212121');
