-- En tant que DBA
CONNECT SYSTEM/password_system;

-- Affecter le profil
ALTER USER GERERTP2 PROFILE GERER_DROITTP2;

-- User altered.

-- Vérification
SELECT
    USERNAME,
    PROFILE
FROM
    DBA_USERS
WHERE
	USERNAME = 'GERERTP2';




-- En tant que DBA
CONNECT SYSTEM/12345678;


