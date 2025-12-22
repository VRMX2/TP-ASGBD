-- En tant que DBA
CONNECT SYSTEM/password_system;

-- Créer le profil Gerer_DroitTP2
CREATE PROFILE Gerer_DroitTP2 LIMIT
    SESSIONS_PER_USER 3              -- 3 sessions simultanées max
    CPU_PER_CALL 3000                -- 30 sec = 3000 centisecondes
    CONNECT_TIME 30                  -- 30 minutes max par session
    LOGICAL_READS_PER_CALL 1500      -- 1500 blocs max par appel
    PRIVATE_SGA 25K                  -- 25 Ko en SGA
    IDLE_TIME 40                     -- 40 min d'inactivité max
    FAILED_LOGIN_ATTEMPTS 3          -- 3 tentatives de connexion
    PASSWORD_LIFE_TIME 80            -- Mot de passe valable 80 jours
	PASSWORD_REUSE_TIME 60 -- Réutilisation après 60 jours
    PASSWORD_LOCK_TIME 1             -- 1 jour de blocage
    PASSWORD_GRACE_TIME 25;          -- 25 jours de période de grâce

-- Profile created.

SELECT
    *
FROM
    DBA_PROFILES
WHERE
    PROFILE = 'GERER_DROITTP2';