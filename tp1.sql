Partie I : Création des TableSpaces et Utilisateurs

Question 1 : Créer deux Tablespaces

-- En tant que DBA
CREATE TABLESPACE Benali_TBS 
DATAFILE 'C:\tbs_benali.dat' 
SIZE 100M 
AUTOEXTEND ON 
ONLINE;

CREATE TEMPORARY TABLESPACE Benali_TempTBS 
TEMPFILE 'C:\temp_benali.dat' 
SIZE 100M 
AUTOEXTEND ON;

QUESTION 2 : CRÉER UN UTILISATEUR
CREATE USER TP1_Benali
IDENTIFIED BY motdepasse123
DEFAULT TABLESPACE Benali_TBS
TEMPORARY TABLESPACE Benali_TempTBS;

QUESTION 3 : DONNER TOUS LES PRIVILÈGES
GRANT ALL PRIVILEGES TO TP1_BENALI;

PARTIE II : LANGAGE DE DÉFINITION DE DONNÉES (DDL)
QUESTION 4 : PROPOSITION DE BASE DE DONNÉES (EXEMPLE : GESTION UNIVERSITAIRE)
SCHÉMA CONCEPTUEL DES 6 TABLES :
DEPARTEMENT (CODEDEPT, NOMDEPT, NOMCHEF)
SPECIALITE (CODESPEC, NOMSPEC, CODEDEPT#)
ETUDIANT (MATRICULEETU, NOMETU, PRENOMETU, DATENAISSANCE, CODESPEC#)
ENSEIGNANT (MATRICULEENS, NOMENS, PRENOMENS, DATERECRUTEMENT, CODEDEPT#)
MODULE (CODEMODULE, NOMMODULE, COEFFICIENT, CODESPEC#)
INSCRIPTION (MATRICULEETU#, CODEMODULE#, DATEINSCRIPTION, NOTE) - CLÉ PRIMAIRE COMPOSÉE

QUESTION 5 : CRÉATION DES RELATIONS AVEC CONTRAINTES
-- Table Departement
CREATE TABLE DEPARTEMENT (
    CODEDEPT VARCHAR2(10) PRIMARY KEY,
    NOMDEPT VARCHAR2(50) NOT NULL,
    NOMCHEF VARCHAR2(50)
);

-- Table Specialite avec C1
CREATE TABLE SPECIALITE (
    CODESPEC VARCHAR2(10) PRIMARY KEY,
    NOMSPEC VARCHAR2(50) NOT NULL,
    NBETUDIANTS NUMBER DEFAULT 0,
    CODEDEPT VARCHAR2(10),
    CONSTRAINT FK_SPEC_DEPT FOREIGN KEY (CODEDEPT) REFERENCES DEPARTEMENT(CODEDEPT) ON DELETE CASCADE,
    CONSTRAINT CHK_CODE_SPEC CHECK (CODESPEC IN ('RSD', 'SII', 'SSI', 'IL')),
    CONSTRAINT CHK_NB_ETU CHECK (NBETUDIANTS < 100) -- C2
);

-- Table Etudiant
CREATE TABLE ETUDIANT (
    MATRICULEETU VARCHAR2(15) PRIMARY KEY,
    NOMETU VARCHAR2(30) NOT NULL,
    PRENOMETU VARCHAR2(30) NOT NULL,
    DATENAISSANCE DATE,
    CODESPEC VARCHAR2(10),
    CONSTRAINT FK_ETU_SPEC FOREIGN KEY (CODESPEC) REFERENCES SPECIALITE(CODESPEC) ON DELETE SET NULL
);

-- Table Enseignant
CREATE TABLE ENSEIGNANT (
    MATRICULEENS VARCHAR2(15) PRIMARY KEY,
    NOMENS VARCHAR2(30) NOT NULL,
    PRENOMENS VARCHAR2(30) NOT NULL,
    DATENAISSANCE DATE,
    DATERECRUTEMENT DATE,
    CODEDEPT VARCHAR2(10),
    CONSTRAINT FK_ENS_DEPT FOREIGN KEY (CODEDEPT) REFERENCES DEPARTEMENT(CODEDEPT)
);

-- Table Module
CREATE TABLE MODULE (
    CODEMODULE VARCHAR2(10) PRIMARY KEY,
    NOMMODULE VARCHAR2(50) NOT NULL,
    COEFFICIENT NUMBER(2),
    CODESPEC VARCHAR2(10),
    CONSTRAINT FK_MOD_SPEC FOREIGN KEY (CODESPEC) REFERENCES SPECIALITE(CODESPEC)
);

-- Table Inscription (Clé primaire composée)
CREATE TABLE INSCRIPTION (
    MATRICULEETU VARCHAR2(15),
    CODEMODULE VARCHAR2(10),
    DATEINSCRIPTION DATE DEFAULT SYSDATE,
    NOTE NUMBER(4, 2),
    CONSTRAINT PK_INSCRIPTION PRIMARY KEY (MATRICULEETU, CODEMODULE),
    CONSTRAINT FK_INSC_ETU FOREIGN KEY (MATRICULEETU) REFERENCES ETUDIANT(MATRICULEETU) ON DELETE CASCADE,
    CONSTRAINT FK_INSC_MOD FOREIGN KEY (CODEMODULE) REFERENCES MODULE(CODEMODULE) ON DELETE CASCADE,
    CONSTRAINT CHK_NOTE CHECK (NOTE BETWEEN 0 AND 20)
);


QUESTION 6 : AJOUTER UN ATTRIBUT
ALTER TABLE ETUDIANT
    ADD EMAIL VARCHAR2(
		50
	);

QUESTION 7 : AJOUTER CONTRAINTE NOT NULL
	-- Pour Etudiant
ALTER TABLE Etudiant MODIFY Email NOT NULL;

-- Pour Enseignant
ALTER TABLE Enseignant MODIFY DateRecrutement NOT NULL;

QUESTION 8 : MODIFIER LA LONGUEUR D''un attribut
-- Agrandir
ALTER TABLE ETUDIANT MODIFY NOMETU VARCHAR2(
    50
);

-- Réduire (attention : doit être vide ou contenir des valeurs compatibles)
ALTER TABLE ETUDIANT MODIFY EMAIL VARCHAR2(
	40
);




QUESTION 9 : SUPPRIMER UNE COLONNE

ALTER TABLE Etudiant DROP COLUMN Email;

-- Vérification
DESC Etudiant;

QUESTION 10 : RENOMMER UNE COLONNE
ALTER TABLE ENSEIGNANT RENAME COLUMN NOMCHEF TO RESPONSABLEDEPT;

-- Vérification
DESC Enseignant;

QUESTION 11 : AJOUTER UNE CONTRAINTE DE CLÉ ÉTRANGÈRE
-- Exemple : ajouter MatriculeEns dans Module
ALTER TABLE MODULE
    ADD MATRICULEENS VARCHAR2(
        15
    );

ALTER TABLE MODULE
    ADD CONSTRAINT FK_MOD_ENS FOREIGN KEY (
        MATRICULEENS
    )
        REFERENCES ENSEIGNANT(
            MATRICULEENS
		);

QUESTION 12 : CONTRAINTE INTRA-RELATION
-- DateNaissance < DateRecrutement pour Enseignant
ALTER TABLE ENSEIGNANT
    ADD CONSTRAINT CHK_DATES CHECK (
		DATENAISSANCE < DATERECRUTEMENT
	);


	QUESTION 13 : CONTRAINTE INTER-RELATION
	-- Exemple : Note moyenne d'un étudiant doit être validée
-- Créer une fonction puis une contrainte CHECK qui l'utilise
-- Ou utiliser un TRIGGER (hors scope direct du CHECK)

-- Alternative simple : Contrainte sur dates entre tables
ALTER TABLE Inscription ADD CONSTRAINT chk_date_insc 
CHECK (DateInscription >= TO_DATE(' 2020-01-01 ', 'YYYY-MM-DD'));


PARTIE III : LANGAGE DE MANIPULATION DE DONNÉES (DML)
QUESTION 14 : REMPLIR LES TABLES AVEC DES ERREURS
-- Insertions valides dans Departement
INSERT INTO DEPARTEMENT VALUES (
    'INFO',
    'Informatique',
    'Dr. Alami'
);

INSERT INTO DEPARTEMENT VALUES (
    'MATH',
    'Mathématiques',
    'Dr. Benali'
);

INSERT INTO DEPARTEMENT VALUES (
    'PHY',
    'Physique',
    'Dr. Cherif'
);

-- Insertions valides dans Specialite
INSERT INTO SPECIALITE VALUES (
    'RSD',
    'Réseaux et Systèmes Distribués',
    45,
    'INFO'
);

INSERT INTO SPECIALITE VALUES (
    'SII',
    'Systèmes Informatiques Intelligents',
    38,
    'INFO'
);

INSERT INTO SPECIALITE VALUES (
    'SSI',
    'Sécurité des Systèmes d''Information',
    52,
    'INFO'
);

INSERT INTO SPECIALITE VALUES (
    'IL',
    'Ingénierie Logicielle',
    60,
    'INFO'
);

-- ERREUR 1 : Violation de CHECK (CodeSpec pas dans la liste)
INSERT INTO SPECIALITE VALUES (
    'IA',
    'Intelligence Artificielle',
    30,
    'INFO'
);

-- ORA-02290: contrainte CHECK violée

-- ERREUR 2 : Violation de CHECK (NbEtudiants >= 100)
INSERT INTO SPECIALITE VALUES (
    'RSD',
    'Test',
    150,
    'INFO'
);

-- ORA-02290: contrainte CHECK violée

-- Insertions valides dans Etudiant
INSERT INTO ETUDIANT VALUES (
	'E001',
    'Amar',
    'Ali',
    TO_DATE('2000-05-15', 'YYYY-MM-DD'),
    'RSD'
);

INSERT INTO ETUDIANT VALUES (
    'E002',
    'Benali',
    'Sara',
    TO_DATE('1999-08-20', 'YYYY-MM-DD'),
    'SII'
);

INSERT INTO ETUDIANT VALUES (
    'E003',
    'Cherif',
    'Mohamed',
    TO_DATE('2001-03-10', 'YYYY-MM-DD'),
    'IL'
);

INSERT INTO ETUDIANT VALUES (
    'E004',
    'Dali',
    'Amina',
    TO_DATE('2000-11-25', 'YYYY-MM-DD'),
    'RSD'
);

INSERT INTO ETUDIANT VALUES (
    'E005',
    'Farid',
    'Karim',
    TO_DATE('1999-12-05', 'YYYY-MM-DD'),
    'SSI'
);

INSERT INTO ETUDIANT VALUES (
    'E006',
    'Ghani',
    'Leila',
    TO_DATE('2001-07-18', 'YYYY-MM-DD'),
    'IL'
);

INSERT INTO ETUDIANT VALUES (
    'E007',
    'Haddad',
    'Nabil',
    TO_DATE('2000-02-28', 'YYYY-MM-DD'),
    'SII'
);

-- ERREUR 3 : Violation de clé étrangère (CodeSpec inexistant)
INSERT INTO ETUDIANT VALUES (
    'E008',
    'Test',
    'Test',
    TO_DATE('2000-01-01', 'YYYY-MM-DD'),
    'XXX'
);

-- ORA-02291: contrainte d'intégrité violée (clé parent inexistante)

-- Insertions valides dans Enseignant
INSERT INTO ENSEIGNANT VALUES (
    'ENS01',
    'Alami',
    'Rachid',
    TO_DATE('1970-05-10', 'YYYY-MM-DD'),
    TO_DATE('1995-09-01', 'YYYY-MM-DD'),
    'INFO'
);

INSERT INTO ENSEIGNANT VALUES (
    'ENS02',
    'Benali',
    'Fatima',
    TO_DATE('1975-03-15', 'YYYY-MM-DD'),
    TO_DATE('2000-09-01', 'YYYY-MM-DD'),
    'INFO'
);

INSERT INTO ENSEIGNANT VALUES (
    'ENS03',
    'Cherif',
    'Ahmed',
    TO_DATE('1968-11-20', 'YYYY-MM-DD'),
    TO_DATE('1998-09-01', 'YYYY-MM-DD'),
    'MATH'
);

INSERT INTO ENSEIGNANT VALUES (
    'ENS04',
    'Daoudi',
    'Samira',
    TO_DATE('1980-07-08', 'YYYY-MM-DD'),
    TO_DATE('2005-09-01', 'YYYY-MM-DD'),
    'INFO'
);

INSERT INTO ENSEIGNANT VALUES (
    'ENS05',
    'Elkhalil',
    'Omar',
    TO_DATE('1972-12-25', 'YYYY-MM-DD'),
    TO_DATE('1997-09-01', 'YYYY-MM-DD'),
    'PHY'
);

INSERT INTO ENSEIGNANT VALUES (
    'ENS06',
    'Fassi',
    'Zineb',
    TO_DATE('1978-09-12', 'YYYY-MM-DD'),
    TO_DATE('2002-09-01', 'YYYY-MM-DD'),
    'INFO'
);

INSERT INTO ENSEIGNANT VALUES (
    'ENS07',
    'Ghali',
    'Youssef',
    TO_DATE('1965-04-30', 'YYYY-MM-DD'),
    TO_DATE('1992-09-01', 'YYYY-MM-DD'),
    'MATH'
);

-- ERREUR 4 : Violation contrainte intra-relation (DateNaissance >= DateRecrutement)
INSERT INTO ENSEIGNANT VALUES (
    'ENS08',
    'Test',
    'Test',
    TO_DATE('1990-01-01', 'YYYY-MM-DD'),
    TO_DATE('1985-01-01', 'YYYY-MM-DD'),
    'INFO'
);

-- ORA-02290: contrainte CHECK violée

-- Insertions valides dans Module
INSERT INTO MODULE VALUES (
    'M01',
    'Bases de Données',
    3,
    'RSD',
    'ENS01'
);

INSERT INTO MODULE VALUES (
    'M02',
    'Réseaux Informatiques',
    3,
    'RSD',
    'ENS02'
);

INSERT INTO MODULE VALUES (
    'M03',
    'Intelligence Artificielle',
    4,
    'SII',
    'ENS04'
);

INSERT INTO MODULE VALUES (
    'M04',
    'Cryptographie',
    3,
    'SSI',
    'ENS06'
);

INSERT INTO MODULE VALUES (
    'M05',
    'Génie Logiciel',
    4,
    'IL',
    'ENS01'
);

INSERT INTO MODULE VALUES (
    'M06',
    'Programmation Web',
    3,
    'IL',
    'ENS02'
);

INSERT INTO MODULE VALUES (
    'M07',
    'Systèmes Distribués',
    3,
    'RSD',
    'ENS04'
);

-- Insertions valides dans Inscription
INSERT INTO INSCRIPTION VALUES (
    'E001',
    'M01',
    TO_DATE('2024-09-15', 'YYYY-MM-DD'),
    15.5
);

INSERT INTO INSCRIPTION VALUES (
    'E001',
    'M02',
    TO_DATE('2024-09-15', 'YYYY-MM-DD'),
    14.0
);

INSERT INTO INSCRIPTION VALUES (
    'E002',
    'M03',
    TO_DATE('2024-09-16', 'YYYY-MM-DD'),
    16.5
);

INSERT INTO INSCRIPTION VALUES (
    'E003',
    'M05',
    TO_DATE('2024-09-17', 'YYYY-MM-DD'),
    13.5
);

INSERT INTO INSCRIPTION VALUES (
    'E004',
    'M01',
    TO_DATE('2024-09-15', 'YYYY-MM-DD'),
    17.0
);

INSERT INTO INSCRIPTION VALUES (
    'E005',
    'M04',
    TO_DATE('2024-09-18', 'YYYY-MM-DD'),
    15.0
);

INSERT INTO INSCRIPTION VALUES (
    'E006',
    'M06',
    TO_DATE('2024-09-19', 'YYYY-MM-DD'),
    14.5
);

INSERT INTO INSCRIPTION VALUES (
    'E007',
    'M03',
    TO_DATE('2024-09-16', 'YYYY-MM-DD'),
    16.0
);

-- ERREUR 5 : Violation de CHECK (Note hors limites)
INSERT INTO INSCRIPTION VALUES (
    'E003',
    'M06',
    TO_DATE('2024-09-20', 'YYYY-MM-DD'),
    25.0
);

-- ORA-02290: contrainte CHECK violée (Note doit être entre 0 et 20)

-- ERREUR 6 : Violation de clé primaire (doublon)
INSERT INTO INSCRIPTION VALUES (
    'E001',
    'M01',
    TO_DATE('2024-09-20', 'YYYY-MM-DD'),
    18.0
);

-- ORA-00001: contrainte d'unicité violée


QUESTION 15 : AUGMENTER VALEUR D'attribut et gérer contrainte
-- Tenter d''augmenter le nombre d'étudiants
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


QUESTION 16 : SUPPRESSION AVEC CLÉS ÉTRANGÈRES
-- Tenter de supprimer un étudiant ayant des inscriptions
DELETE FROM ETUDIANT
WHERE
    MATRICULEETU = 'E001';

-- PROBLÈME :
-- Si ON DELETE CASCADE est défini : suppression en cascade des inscriptions
-- Si ON DELETE SET NULL : mise à NULL des clés étrangères
-- Sinon : ORA-02292 (contrainte d'intégrité violée - enregistrement fils existant)


QUESTION 17 : VÉRIFICATION DES VIOLATIONS
-- Insertion violant contrainte
INSERT INTO SPECIALITE VALUES (
    'XXX',
    'Test',
    200,
    'INFO'
);

-- Erreur CHECK

-- Modification violant contrainte
UPDATE ETUDIANT
SET
    CODESPEC = 'XXX'
WHERE
    MATRICULEETU = 'E001';

-- Erreur FK

-- Suppression possible
DELETE FROM INSCRIPTION
WHERE
    MATRICULEETU = 'E007'
    AND CODEMODULE = 'M03';

-- OK

-- Suppression provoquant erreur
DELETE FROM DEPARTEMENT
WHERE
    CODEDEPT = 'INFO';

-- Erreur si pas de CASCADE et qu'il y a des spécialités liées

PARTIE IV : LANGAGE D''Interrogation (SQL)
Question 18 : Jointure et restrictions

SELECT e.MatriculeEtu, e.NomEtu, e.PrenomEtu,
       m.NomModule, i.Note, s.NomSpec
FROM Etudiant e
JOIN Inscription i ON e.MatriculeEtu = i.MatriculeEtu
JOIN Module m ON i.CodeModule = m.CodeModule
JOIN Specialite s ON e.CodeSpec = s.CodeSpec
WHERE i.Note >= 10 
  AND s.CodeSpec IN ('RSD', 'IL')
ORDER BY e.NomEtu;

QUESTION 19 : GROUP BY AVEC FONCTION DE CALCUL
SELECT e.CodeSpec, s.NomSpec,
       COUNT(*) AS NombreEtudiants,
       AVG(i.Note) AS MoyenneGenerale,
       MAX(i.Note) AS MeilleureNote,
       MIN(i.Note) AS PlusBasseNote
FROM Etudiant e
JOIN Inscription i ON e.MatriculeEtu = i.MatriculeEtu
JOIN Specialite s ON e.CodeSpec = s.CodeSpec
GROUP BY e.CodeSpec, s.NomSpec
HAVING AVG(i.Note) >= 12
ORDER BY MoyenneGenerale DESC;

QUESTION 20 : CRÉER UNE VUE
-- Création de la vue
CREATE VIEW VUE_STATS_SPECIALITES AS
    SELECT
        E.CODESPEC,
        S.NOMSPEC,
        COUNT(*)    AS NOMBREETUDIANTS,
        AVG(I.NOTE) AS MOYENNEGENERALE,
        MAX(I.NOTE) AS MEILLEURENOTE,
        MIN(I.NOTE) AS PLUSBASSENOTE
    FROM
        ETUDIANT    E
        JOIN INSCRIPTION I
        ON E.MATRICULEETU = I.MATRICULEETU
        JOIN SPECIALITE S
        ON E.CODESPEC = S.CODESPEC
	GROUP BY
        E.CODESPEC,
        S.NOMSPEC;

-- Interroger la vue
SELECT
    *
FROM
    VUE_STATS_SPECIALITES
WHERE
    MOYENNEGENERALE >= 12
ORDER BY
	MOYENNEGENERALE DESC;


    