-- Insertion violant contrainte
INSERT INTO SPECIALITE VALUES (
    'XXX',
    'Test',
    200,
    'INFO'
);

-- Erreur CHECK

-- Modification violant contrainte
UPDATE ETUDIANT
SET
    CODESPEC = 'XXX'
WHERE
    MATRICULEETU = 'E001';

-- Erreur FK

-- Suppression possible
DELETE FROM INSCRIPTION
WHERE
    MATRICULEETU = 'E007'
    AND CODEMODULE = 'M03';

-- OK

-- Suppression provoquant erreur
DELETE FROM DEPARTEMENT
WHERE
    CODEDEPT = 'INFO';

-- Erreur si pas de CASCADE et qu'il y a des spécialités liées