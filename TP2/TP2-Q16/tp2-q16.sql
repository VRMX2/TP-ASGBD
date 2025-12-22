-- En tant que TP1_Benali (propriétaire)
CONNECT TP1_Benali/motdepasse123;

-- Donner le privilège INDEX au RÔLE GestionTP2
GRANT INDEX ON ETUDIANT TO GESTIONTP2;

-- Grant succeeded.

-- REVENIR en tant que GererTP2
CONNECT GererTP2/motdepasse456;

-- Réessayer de créer l'index
CREATE INDEX IDX_NOM_ETU ON TP1_BENALI.ETUDIANT(NOMETU);

-- Index created.

-- Voir les index sur la table
SELECT
    INDEX_NAME,
    TABLE_NAME,
	COLUMN_NAME
FROM
    ALL_IND_COLUMNS
WHERE
    TABLE_NAME = 'ETUDIANT'
    AND TABLE_OWNER = 'TP1_BENALI';