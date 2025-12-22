-- En tant que GererTP2
CONNECT GererTP2/motdepasse456;

-- Essayer de créer un index sur la table Etudiant de TP1_Benali
CREATE INDEX IDX_NOM_ETU ON TP1_BENALI.ETUDIANT(NOMETU);