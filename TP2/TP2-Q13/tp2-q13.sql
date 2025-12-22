-- En tant que TP1_Benali (propriétaire des tables)
CONNECT TP1_Benali/motdepasse123;

-- Créer le rôle
CREATE ROLE GESTIONTP2;

-- Role created.

-- Attribuer les privilèges au rôle
-- Voir 2 tables
GRANT SELECT ON ETUDIANT TO GESTIONTP2;

GRANT SELECT ON MODULE TO GESTIONTP2;

-- Modifier 1 table
GRANT UPDATE ON INSCRIPTION TO GESTIONTP2;

-- Grant succeeded. (pour chaque commande)

SELECT
    *
FROM
    ROLE_TAB_PRIVS
WHERE
    ROLE = 'GESTIONTP2';