-- En tant que DBA
CONNECT SYSTEM/password_system;

-- Donner les privilèges
GRANT CREATE TABLE TO GERERTP2;

GRANT CREATE USER TO GERERTP2;

-- Vérification des privilèges système
SELECT
    PRIVILEGE
FROM
    DBA_SYS_PRIVS
WHERE
    GRANTEE = 'GERERTP2';