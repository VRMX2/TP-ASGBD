-- Vérifier les privilèges système
SELECT
    PRIVILEGE
FROM
    DBA_SYS_PRIVS
WHERE
    GRANTEE = 'GERERTP2';

-- CREATE SESSION et CREATE USER restent, CREATE TABLE supprimé

-- Vérifier les privilèges sur les objets
SELECT
    *
FROM
    DBA_TAB_PRIVS
WHERE
    GRANTEE = 'GERERTP2';

-- Aucune ligne (privilèges sur objets supprimés)

-- Test : Se connecter en tant que GererTP2 et essayer
CONNECT GererTP2/motdepasse456;

-- Tester SELECT (doit échouer)
SELECT
    *
FROM
    TP1_BENALI.ETUDIANT;

-- ORA-00942: table or view does not exist

-- Tester CREATE TABLE (doit échouer)
CREATE TABLE TEST2 (
    ID NUMBER
);

-- ORA-01031: insufficient privileges