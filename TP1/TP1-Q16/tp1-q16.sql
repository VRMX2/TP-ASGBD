-- Tenter de supprimer un étudiant ayant des inscriptions
DELETE FROM ETUDIANT
WHERE
    MATRICULEETU = 'E001';

-- PROBLÈME :
-- Si ON DELETE CASCADE est défini : suppression en cascade des inscriptions
-- Si ON DELETE SET NULL : mise à NULL des clés étrangères
-- Sinon : ORA-02292 (contrainte d'intégrité violée - enregistrement fils existant)