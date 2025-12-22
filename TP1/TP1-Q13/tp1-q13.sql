-- Exemple : Note moyenne d'un étudiant doit être validée
-- Créer une fonction puis une contrainte CHECK qui l'utilise
-- Ou utiliser un TRIGGER (hors scope direct du CHECK)

-- Alternative simple : Contrainte sur dates entre tables
ALTER TABLE INSCRIPTION
	ADD CONSTRAINT CHK_DATE_INSC CHECK (
        DATEINSCRIPTION >= TO_DATE('2020-01-01', 'YYYY-MM-DD')
    );