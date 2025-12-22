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




	ALTER TABLE Enseignant ADD CONSTRAINT chk_dates
CHECK (DateNaiss < DateRecrutement);