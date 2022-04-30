/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
    name            VARCHAR(255)                         NOT NULL,
    date_of_birth   DATE                                 NOT NULL,
    escape_attempts INT                                  NOT NULL,
    neutered        BOOLEAN                              NOT NULL,
    weight_kg       DECIMAL                              NOT NULL
);

/*
 * Add a column species of type string to your animals table
*/

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

/*
 * Create a table named owners with the following columns:
    - id: integer (set it as autoincremented PRIMARY KEY)
    - full_name: string
    - age: integer
*/

CREATE TABLE owners (
    owner_id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
    full_name       VARCHAR(255)                         NOT NULL,
    age             INT                                  NOT NULL
);

/*
 * Create a table named species with the following columns:
    - id: integer (set it as autoincremented PRIMARY KEY)
    - name: string
*/

CREATE TABLE species (
    species_id      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
    name            VARCHAR(255)                         NOT NULL
);

/*
 * Modify animals table:
    - Make sure that id is set as autoincremented PRIMARY KEY
    - Remove column species
    - Add column species_id which is a foreign key referencing species table
    - Add column owner_id which is a foreign key referencing the owners table
*/

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id BIGINT REFERENCES species(species_id) ON DELETE CASCADE;
ALTER TABLE animals ADD COLUMN owner_id BIGINT REFERENCES owners(owner_id) ON DELETE CASCADE;

/*
 * Create a table named vets with the following columns:
    - id: integer (set it as autoincremented PRIMARY KEY)
    - name: string
    - age: integer
    - date_of_graduation: date
*/

CREATE TABLE vets (
    vet_id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
    name                VARCHAR(255)                         NOT NULL,
    age                 INT                                  NOT NULL,
    date_of_graduation  DATE                                 NOT NULL
);

/*
 * There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle the relationship many-to-many relationship between the tables species and vets.
    - id: integer (set it as autoincremented PRIMARY KEY)
    - vet_id: integer (foreign key referencing vets table)
    - species_id: integer (foreign key referencing species table)
*/

CREATE TABLE specializations (
    specialization_id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
    vet_id              BIGINT REFERENCES vets(vet_id) ON DELETE CASCADE,
    species_id          BIGINT REFERENCES species(species_id) ON DELETE CASCADE
);

/*
 * There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
 */

CREATE TABLE visits (
    visit_id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
    vet_id              BIGINT REFERENCES vets(vet_id) ON DELETE CASCADE,
    animal_id           BIGINT REFERENCES animals(animal_id) ON DELETE CASCADE,
    date                DATE                                 NOT NULL
);

