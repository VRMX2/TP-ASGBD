-- SE CONNECTER en tant que TP1_Benali (propriétaire de la table)
CONNECT TP1_Benali/motdepasse123;

-- Donner le privilège SELECT à GererTP2
GRANT SELECT ON ETUDIANT TO GERERTP2;

-- Grant succeeded.

-- REVENIR en tant que GererTP2
CONNECT GererTP2/motdepasse456;

-- Maintenant la requête fonctionne
SELECT
    *
FROM
    TP1_BENALI.ETUDIANT;