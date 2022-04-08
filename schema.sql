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
