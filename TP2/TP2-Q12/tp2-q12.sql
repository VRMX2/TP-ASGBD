-- En tant que TP1_Benali (propriétaire)
CONNECT TP1_Benali/motdepasse123;

-- Donner le privilège UPDATE
GRANT UPDATE ON ETUDIANT TO GERERTP2;

-- Grant succeeded.

-- REVENIR en tant que GererTP2
CONNECT GererTP2/motdepasse456;

-- Réessayer la modification
UPDATE TP1_BENALI.ETUDIANT
SET
    NOMETU = 'NOUVEAU_NOM'
WHERE
    MATRICULEETU = 'E001';

-- 1 row updated.

-- Valider la modification
COMMIT;