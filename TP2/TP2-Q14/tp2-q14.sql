-- Toujours en tant que TP1_Benali (ou DBA)
GRANT GESTIONTP2 TO GERERTP2;

-- Grant succeeded.

-- Vérification des rôles de l'utilisateur
SELECT
    *
FROM
    DBA_ROLE_PRIVS
WHERE
	GRANTEE = 'GERERTP2';

	-- Les privilèges du rôle
SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE = 'GESTIONTP2';