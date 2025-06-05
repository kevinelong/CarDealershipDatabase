-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT name from dealerships
join INVENTORY ON INVENTORY.dealership_id = dealerships.dealership_id
join vehicles on vehicles.vehicle_id = inventory.vehicle_id
where make = 'Kia' AND model = 'Sorento' AND color = 'Green' -- AND year = 2025
