-- Tenter d'augmenter le nombre d'étudiants
UPDATE SPECIALITE
SET
    NBETUDIANTS = NBETUDIANTS + 10
WHERE
    CODESPEC IN ('IL', 'RSD');

-- REMARQUE : Si NbEtudiants + 10 >= 100, erreur de contrainte CHECK

-- Désactiver la contrainte
ALTER TABLE SPECIALITE DISABLE CONSTRAINT CHK_NB_ETU;

-- Faire la modification
UPDATE SPECIALITE
SET
    NBETUDIANTS = NBETUDIANTS + 10
WHERE
	CODESPEC IN ('IL', 'RSD');

-- Réactiver la contrainte
ALTER TABLE SPECIALITE ENABLE CONSTRAINT CHK_NB_ETU;

-- Si des lignes violent la contrainte, l'activation échouera