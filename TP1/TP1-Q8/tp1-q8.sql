-- Agrandir
ALTER TABLE ETUDIANT MODIFY NOMETU VARCHAR2(
    50
);

-- Réduire (attention : doit être vide ou contenir des valeurs compatibles)
ALTER TABLE ETUDIANT MODIFY EMAIL VARCHAR2(
    40
);