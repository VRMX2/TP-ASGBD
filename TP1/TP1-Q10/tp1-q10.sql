-- La colonne NomChef est dans Departement, pas dans Enseignant
ALTER TABLE DEPARTEMENT RENAME COLUMN NOMCHEF TO RESPONSABLEDEPT;

-- Vérification
DESC Departement;

-- OU si vous voulez renommer une colonne dans Enseignant :
ALTER TABLE ENSEIGNANT RENAME COLUMN DATENAISSANCE TO DATENAISS;

-- Vérification
DESC Enseignant;