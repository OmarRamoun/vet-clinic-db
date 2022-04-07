/* Database schema to keep the structure of entire database. */

/*
POSTGRESQL
Create a table named animals with the following columns:
    id: integer
    name: string
    date_of_birth: date
    escape_attempts: integer
    neutered: boolean
    weight_kg: decimal
*/

CREATE TABLE animals (
    id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
    name            VARCHAR(255)                         NOT NULL,
    date_of_birth   DATE                                 NOT NULL,
    escape_attempts INT                                  NOT NULL,
    neutered        BOOLEAN                              NOT NULL,
    weight_kg       DECIMAL                              NOT NULL
);
