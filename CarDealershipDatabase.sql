--1. Get all dealerships
--2. Find all vehicles for a specific dealership
--3. Find a car by VIN
--4. Find the dealership where a certain car is located, by VIN
--5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
--6. Get all sales information for a specific dealer for a specific date range
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
  vehicle_id INT,
  PRIMARY KEY (inventory_id)
);

CREATE TABLE sales_contracts (
  sales_contracts_id INT AUTO_INCREMENT,
  customer_name VARCHAR(255),
  dealership_id INT,
  vehicle_id INT,
  PRIMARY KEY (sales_contracts_id)
);

CREATE TABLE lease_contracts (
  lease_contracts_id INT AUTO_INCREMENT,
  customer_name VARCHAR(255),
  dealership_id INT,
  vehicle_id INT,
  PRIMARY KEY (lease_contracts_id)
);

ALTER TABLE `cardealership`.`sales_contracts`
ADD COLUMN `when` DATETIME NULL DEFAULT NOW() AFTER `vehicle_id`;

-- ALTER TABLE statements to add constraints

-- Add foreign key to inventory table referencing dealerships
ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_dealership
FOREIGN KEY (dealership_id) REFERENCES dealerships (dealership_id);

-- Add foreign key to inventory table referencing vehicles (using vehicle_id)
ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_vehicle
FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id);

-- Add foreign key to sales_contracts table referencing dealerships
ALTER TABLE sales_contracts
ADD CONSTRAINT fk_sales_contract_dealership
FOREIGN KEY (dealership_id) REFERENCES dealerships (dealership_id);

-- Add foreign key to sales_contracts table referencing vehicles (using vehicle_id)
ALTER TABLE sales_contracts
ADD CONSTRAINT fk_sales_contract_vehicle
FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id);

-- Add foreign key to lease_contracts table referencing dealerships
ALTER TABLE lease_contracts
ADD CONSTRAINT fk_lease_contract_dealership
FOREIGN KEY (dealership_id) REFERENCES dealerships (dealership_id);

-- Add foreign key to lease_contracts table referencing vehicles (using vehicle_id)
ALTER TABLE lease_contracts
ADD CONSTRAINT fk_lease_contract_vehicle
FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id);


-- Insert statements for dealerships table
INSERT INTO dealerships (name, address, phone) VALUES
('Luxury Autos NYC', '123 Main St, New York, NY 10001', '212-555-1234'),
('West Coast Motors', '456 Ocean Ave, Los Angeles, CA 90210', '310-555-5678'),
('Midwest Cars & Trucks', '789 Prairie Ln, Chicago, IL 60601', '312-555-9012'),
('Southern Star Auto Group', '101 Dixie Hwy, Miami, FL 33101', '305-555-3456'),
('Pacific Northwest Autos', '222 Forest Rd, Seattle, WA 98101', '206-555-7890'),
('Mountain View Motors', '333 Peak Dr, Denver, CO 80201', '303-555-2109'),
('Southwest Desert Dealership', '444 Cactus Ct, Phoenix, AZ 85001', '602-555-8765'),
('Great Lakes Automotive', '555 Lake Shore Dr, Cleveland, OH 44101', '216-555-4321'),
('Northeast Car Emporium', '666 Elm St, Boston, MA 02101', '617-555-9876'),
('Sunshine Auto Center', '777 Ocean Blvd, Orlando, FL 32801', '407-555-1212'),
('Texas Auto Giants', '888 Lone Star Rd, Houston, TX 77001', '713-555-3434'),
('Golden State Dealerships', '999 Golden Gate Ave, San Francisco, CA 94101', '415-555-5656'),
('Atlantic Coast Cars', '111 Boardwalk, Atlantic City, NJ 08401', '609-555-7878'),
('Great Plains Autos', '222 Wheatfield Way, Omaha, NE 68101', '402-555-9090');

-- Insert statements for vehicles table (including realistic VINs)
INSERT INTO vehicles (vin, make, model, year, color) VALUES
('1FASW7119CY123456', 'Ford', 'F-150', 2024, 'White'),
('2T3CW1EE4CR010203', 'Toyota', 'Camry', 2025, 'Black'),
('3VW1F7HP6FM456789', 'Volkswagen', 'Jetta', 2024, 'Gray'),
('5J6SK7CA2DM901234', 'Honda', 'Civic', 2025, 'Silver'),
('JM1GP2F31AR567890', 'Mazda', 'CX-5', 2024, 'Blue'),
('WDBBF8EB5FM112233', 'Mercedes-Benz', 'C-Class', 2025, 'Red'),
('1G1FS8F21FL678901', 'Chevrolet', 'Equinox', 2024, 'Brown'),
('KL8CF1AE3FP234567', 'Kia', 'Sorento', 2025, 'Green'),
('JTDKN3DP1EM890123', 'Subaru', 'Outback', 2024, 'Beige'),
('KM8KR7DE9MP456789', 'Hyundai', 'Elantra', 2025, 'Yellow'),
('WAUPB7FF0FM334455', 'Audi', 'A4', 2024, 'Orange'),
('ZARAA7AD9FP678901', 'Alfa Romeo', 'Giulia', 2025, 'Purple'),
('JF1AA7J2XFM112233', 'Toyota', 'Corolla', 2024, 'Black'),
('5UXTW7C5XFL456789', 'BMW', '3 Series', 2025, 'White');

-- Insert statements for inventory table
INSERT INTO inventory (dealership_id, vehicle_id) VALUES
(1, 1), (1, 3), (1, 5), (1, 7), (1, 9), (1, 11), (1, 13),
(2, 2), (2, 4), (2, 6), (2, 8), (2, 10), (2, 12), (2, 14),
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8),
(4, 9), (4, 10), (4, 11), (4, 12), (4, 13), (4, 14), (4, 1), (4, 2),
(5, 3), (5, 4), (5, 5), (5, 6), (5, 7), (5, 8), (5, 9), (5, 10),
(6, 11), (6, 12), (6, 13), (6, 14), (6, 1), (6, 2), (6, 3), (6, 4);

-- Insert statements for sales_contracts table
INSERT INTO sales_contracts (customer_name, dealership_id, vehicle_id) VALUES
('John Smith', 1, 1),
('Jane Doe', 2, 2),
('Peter Jones', 3, 3),
('Mary Williams', 4, 4),
('David Brown', 5, 5),
('Laura Miller', 6, 6),
('Michael Davis', 1, 7),
('Sarah Garcia', 2, 8),
('Robert Rodriguez', 3, 9),
('Jennifer Wilson', 4, 10),
('William Martinez', 5, 11),
('Jessica Anderson', 6, 12),
('Daniel Taylor', 1, 13),
('Ashley Thomas', 2, 14);

-- Insert statements for lease_contracts table
INSERT INTO lease_contracts (customer_name, dealership_id, vehicle_id) VALUES
('Chris Johnson', 1, 14),
('Amanda White', 2, 13),
('Brian Thompson', 3, 12),
('Melissa Harris', 4, 11),
('Paul Clark', 5, 10),
('Nicole Lewis', 6, 9),
('Kevin Robinson', 1, 8),
('Elizabeth Walker', 2, 7),
('Jason Perez', 3, 6),
('Stephanie Hall', 4, 5),
('Matthew Young', 5, 4),
('Megan Allen', 6, 3),
('Joshua Sanchez', 1, 2),
('Samantha Wright', 2, 1);