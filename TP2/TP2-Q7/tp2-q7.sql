-- En tant que TP1_Benali (propriétaire)
CONNECT TP1_Benali/motdepasse123;

-- Révoquer le privilège SELECT
REVOKE SELECT ON ETUDIANT FROM GERERTP2;

-- Revoke succeeded.

-- En tant que DBA pour les privilèges système
CONNECT SYSTEM/password_system;

-- Révoquer CREATE TABLE
REVOKE CREATE TABLE FROM GERERTP2;

-- Revoke succeeded.