-- Active: 1747448160566@@localhost@5432@conservation_db
CREATE DATABASE conservation_db;


 -- create table rangers
 CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
 );


 

 CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(100),
    discover_date DATE,
    conservation_status VARCHAR(50)
 );

 -- create table sightings

 CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(150) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT

 );
DROP TABLE sightings;


 INSERT INTO rangers(name, region) VALUES
 ('Alice Green', 'Northern Hills'),
 ('Bob White', 'River Delta'),
 ('Carol King', 'Mountain Range');

 SELECT * FROM rangers;

 INSERT INTO species (common_name, scientific_name, discover_date, conservation_status) VALUES
 ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * FROM species;

INSERT INTO sightings ( species_id, ranger_id, location, sighting_time,  notes) VALUES 
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM sightings

-- problem: 1

INSERT INTO rangers(name, region) VALUES('Derek Fox', 'Coastal Plains');


-- problem: 2 
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;


-- Problem: 3 
SELECT * FROM sightings WHERE location ILIKE '%Pass%';


-- Problem: 4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r 
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name ASC;


-- Problem: 5 
SELECT s.common_name 
FROM species s 
LEFT JOIN sightings si ON s.species_id = si.species_id
WHERE si.sighting_id IS NULL;


-- Problem: 6
SELECT sp.common_name, si.sighting_time, r.name 
FROM sightings si 
JOIN species sp ON sp.species_id = si.species_id
JOIN rangers r ON r.ranger_id = si.ranger_id
ORDER BY sighting_time DESC
LIMIT 2;


-- Problem: 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discover_date <'1800-01-01'


-- Problem: 8 
SELECT sighting_id,
CASE 
WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS tim_of_day
FROM sightings; 


-- Problem: 9 
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);

