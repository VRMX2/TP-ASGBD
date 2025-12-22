-- SE CONNECTER en tant que GererTP2
CONNECT GererTP2/motdepasse456;

-- Essayer de modifier une table de TP1_Benali
UPDATE TP1_BENALI.ETUDIANT
SET
	NOMETU = 'NOUVEAU_NOM'
WHERE
    MATRICULEETU = 'E001';