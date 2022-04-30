/* Queries that provide answers to the questions from all projects. */

/*
  * Find all animals whose name ends in "mon".
  * List the name of all animals born between 2016 and 2019.
  * List the name of all animals that are neutered and have less than 3 escape attempts.
  * List date of birth of all animals named either "Agumon" or "Pikachu".
  * List name and escape attempts of animals that weigh more than 10.5kg.
  * Find all animals that are neutered.
  * Find all animals not named Gabumon.
  * Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg).
*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE EXTRACT (YEAR FROM date_of_birth) >= 2016 AND EXTRACT(YEAR FROM date_of_birth) <= 2019;
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT * FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT * FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/*
 * Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before transaction
*/

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/*
 * Inside a transaction:

  - Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
  - Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
  - Commit the transaction.
  - Verify that change was made and persists after commit.
*/

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

/*
 * Inside a transaction delete all records in the animals table, then roll back the transaction.
 * After the roll back verify if all records in the animals table still exist.
*/

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/*
 * Inside a transaction:

  - Delete all animals born after Jan 1st, 2022.
  - Create a savepoint for the transaction.
  - Update all animals' weight to be their weight multiplied by -1.
  - Rollback to the savepoint
  - Update all animals' weights that are negative to be their weight multiplied by -1.
  - Commit transaction
*/

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/*
 * Write queries to answer the following questions:
  - How many animals are there?
  - How many animals have never tried to escape?
  - What is the average weight of animals?
  - Who escapes the most, neutered or not neutered animals?
  - What is the minimum and maximum weight of each type of animal?
  - What is the average number of escape attempts per animal type of those born between 1990 and 2000?
*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT ROUND(AVG(weight_kg), 2) AS average_weight_kg FROM animals;
SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
  FROM animals
  WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals)
  GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight_kg, MAX(weight_kg) AS max_weight_kg
  FROM animals
  GROUP BY species;
SELECT species, ROUND(AVG(escape_attempts), 2) AS average_escape_attempts
  FROM animals
  WHERE EXTRACT(YEAR FROM date_of_birth) >= 1990 AND EXTRACT(YEAR FROM date_of_birth) <= 2000
  GROUP BY species;
