-- Revenir en tant que DBA
CONNECT SYSTEM/password_system;

-- Donner le privilège CREATE SESSION
GRANT CREATE SESSION TO GERERTP2;

-- Grant succeeded.

-- Tenter à nouveau de se connecter
CONNECT GererTP2/motdepasse456;

-- Connected.