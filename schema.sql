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
