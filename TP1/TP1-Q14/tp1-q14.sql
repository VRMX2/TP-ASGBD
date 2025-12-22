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