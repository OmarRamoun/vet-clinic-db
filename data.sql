/* Populate database with sample data. */

/*
 * Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
 * Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
 * Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
 * Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
*/

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', DATE '2020-02-03', 0, true, 10.23);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', DATE '2018-11-15', 2, true, 8);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', DATE '2021-01-07', 1, false, 15.04);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', DATE '2017-05-12', 5, true, 11);

/*
 Insert the following data:
  * Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
  * Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
  * Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times.
  * Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
  * Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
  * Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.
  * Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times.
 */

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', DATE '2020-02-08', 0, false, -11);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', DATE '2021-11-15', 2, true, -5.7);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', DATE '1993-04-02', 3, false, -12.13);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', DATE '2005-06-12', 1, true, -45);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', DATE '2005-06-07', 7, true, 20.4);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', DATE '1998-10-13', 3, true, 17);

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', DATE '2022-05-14', 4, true, 22);

/*
 * Insert the following data into the owners table:
  - Sam Smith 34 years old.
  - Jennifer Orwell 19 years old.
  - Bob 45 years old.
  - Melody Pond 77 years old.
  - Dean Winchester 14 years old.
  - Jodie Whittaker 38 years old.
*/

INSERT INTO owners
(full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners
(full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners
(full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners
(full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners
(full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners
(full_name, age)
VALUES ('Jodie Whittaker', 38);

/*
 * Insert the following data into the species table:
  - Pokemon
  - Digimon
*/

INSERT INTO species
(name)
VALUES ('Pokemon');

INSERT INTO species
(name)
VALUES ('Digimon');

/*
 * Modify your inserted animals so it includes the species_id value:
  - If the name ends in "mon" it will be Digimon
  - All other animals are Pokemon
*/

UPDATE animals
SET species_id = (SELECT species_id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT species_id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';

/*
 * Modify your inserted animals to include owner information (owner_id):
  - Sam Smith owns Agumon.
  - Jennifer Orwell owns Gabumon and Pikachu.
  - Bob owns Devimon and Plantmon.
  - Melody Pond owns Charmander, Squirtle, and Blossom.
  - Dean Winchester owns Angemon and Boarmon.
*/

UPDATE animals
SET owner_id = (SELECT owner_id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT owner_id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = (SELECT owner_id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT owner_id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT owner_id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon';


/*Populate vets table*/INSERT INTO vets (
 	name,
 	age,
 	date_of_graduation
 ) VALUES (
 	'William Tatcher',
 	45,
 	'2000-04-23'
 );

 INSERT INTO vets (
 	name,
 	age,
 	date_of_graduation
 ) VALUES (
 	'Maisy Smith',
 	26,
 	'2019-01-17'
 );

 INSERT INTO vets (
 	name,
 	age,
 	date_of_graduation
 ) VALUES (
 	'Stephanie Mendez',
 	64,
 	'1981-05-04'
 );

 INSERT INTO vets (
 	name,
 	age,
 	date_of_graduation
 ) VALUES (
 	'Jack Harkness',
 	38,
 	'2008-06-08'
 );


/*Populate specializations table*/
INSERT INTO specializations (specie_id, vet_id)
SELECT species.species_id , vets.vet_id
FROM species
INNER JOIN vets ON vets.name = 'William Tatcher' AND species.name = 'Pokemon';

INSERT INTO specializations (specie_id, vet_id)
SELECT species.species_id , vets.vet_id
FROM species
INNER JOIN vets ON vets.name = 'Stephanie Mendez' AND species.name IN ('Digimon', 'Pokemon');

INSERT INTO specializations (specie_id, vet_id)
SELECT species.species_id , vets.vet_id
FROM species
INNER JOIN vets ON vets.name = 'Jack Harkness' AND species.name = 'Digimon';

/*Populate visits table*/
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-05-24'
FROM animals
INNER JOIN vets ON vets.name = 'William Tatcher' AND animals.name = 'Agumon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-06-22'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez' AND animals.name = 'Agumon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2021-02-02'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness' AND animals.name = 'Gabumon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-01-05'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Pikachu';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-03-08'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Pikachu';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-05-14'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Pikachu';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2021-05-04'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez' AND animals.name = 'Devimon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2021-02-24'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness' AND animals.name = 'Charmander';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2019-12-21'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Plantmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-08-10'
FROM animals
INNER JOIN vets ON vets.name = 'William Tatcher' AND animals.name = 'Plantmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2021-04-07'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Plantmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2019-09-29'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez' AND animals.name = 'Squirtle';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-10-03'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness' AND animals.name = 'Angemon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-11-04'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness' AND animals.name = 'Angemon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2019-01-24'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Boarmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2019-05-15'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Boarmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-02-27'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Boarmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-08-03'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith' AND animals.name = 'Boarmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2020-05-24'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez' AND animals.name = 'Boarmon';

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id , vets.vet_id , '2021-01-11'
FROM animals
INNER JOIN vets ON vets.name = 'William Tatcher' AND animals.name = 'Boarmon';

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT vet_id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
INSERT INTO owners (full_name, email)
SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
