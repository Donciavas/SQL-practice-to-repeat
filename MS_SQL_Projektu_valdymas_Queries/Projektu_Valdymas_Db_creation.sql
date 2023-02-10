USE Projektu_valdymas;
CREATE TABLE PROJEKTAS(
    "ID" INTEGER NOT NULL,
    "PAVADINIMAS" VARCHAR(255)
);   
            
INSERT INTO PROJEKTAS VALUES
(1, 'Izola'),
(2, 'Registrų Centras'),
(3, 'Kaunas');   
        
CREATE  TABLE SKYRIUS(
    PAVADINIMAS VARCHAR(255) NOT NULL,
    VADOVAS_ASMENSKODAS VARCHAR(255)
); 

INSERT INTO SKYRIUS VALUES
('Java', '48509141175'),
('Testavimo', '38804172782'),
('C#', '38904172782');        

CREATE TABLE "DARBUOTOJAS"(
    ASMENSKODAS CHAR(11) NOT NULL,
    VARDAS VARCHAR(255),
    PAVARDE VARCHAR(255),
    DIRBANUO DATE,
    GIMIMOMETAI DATE,
    PAREIGOS VARCHAR(255),
    SKYRIUS_PAVADINIMAS VARCHAR(255),
    PROJEKTAS_ID INTEGER
);              
         
INSERT INTO [DARBUOTOJAS] VALUES
('38101122335', 'Petras', 'Petraitis', '2009-10-30', '1981-01-11', 'Testuotojas', 'Testavimo', 1),
('38010101234', 'Jonas', 'Jonaitis', '2007-05-30', '1980-10-10', 'Programuotojas', 'Java', 2),
('38103201435', 'Rimas', 'Plekaitis',  '2009-10-30',  '1981-03-20', 'Programuotojas', 'Java', 3),
('48509141175', 'Zita', 'Lietuvaitė',  '2012-06-15',  '1985-09-14', 'Projektų vadovė', 'Java', 2),
('48410121275', 'Jurga', 'Jurgaityte',  '2011-02-12',  '1984-10-12', 'Programuotoja', 'C#', 1),
('38807201234', 'Giedrius', 'Sabutis',  '2009-01-21',  '1988-07-20', 'Testuotojas', 'Testavimo', 2),
('38807291234', 'Regimantas', 'Sabonis',  '2013-01-21',  '1988-07-29', 'Testuotojas', 'Testavimo', 3),
('38609191234', 'Saulius', 'Sabonis',  '2013-01-21',  '1986-09-19', 'Testuotojas', 'Testavimo', 3),
('38109197598', 'Justas', 'Sabonis',  '2011-12-17',  '1986-09-19', 'Testuotojas', 'Testavimo', 1),
('38503142412', 'Jonas', 'Kalnas',  '2009-05-11',  '1985-03-24', 'Programuotojas', 'Java', 1),
('39003142412', 'Stasys', 'Sakalas',  '2009-05-11',  '1990-03-24', 'Programuotojas', 'Java', 3),
('37803142412', 'Povilas', 'Vakalas',  '2012-11-11',  '1978-03-14', 'Programuotojas', 'C#', 2),
('38804172782', 'Deivydas', 'Piliukas',  '2011-12-11',  '1988-04-17', 'Projektu vadovas', 'Testavimo', 2),
('38904172782', 'Kestas', 'Liutas',  '2012-12-11',  '1989-04-17', 'Projektu vadovas', 'C#', 1),
('38901228523', 'laikinas', 'veikejas',  '2009-01-22',  '1989-01-22', NULL, NULL, NULL);

CREATE TABLE Projektai (
    "Nr" integer NOT NULL,
    "Pavadinimas" VARCHAR(255),
    "Svarba" VARCHAR(255),
    "Pradžia" date,
    "Trukmė" integer
);

CREATE TABLE Vykdymas (
    "Projektas" integer NOT NULL,
    "Vykdytojas" integer NOT NULL,
    "Statusas" VARCHAR(255),
    "Valandos" integer
);

CREATE TABLE Vykdytojai (
    "Nr" integer NOT NULL,
    "Pavardė" VARCHAR(255),
    "Kvalifikacija" VARCHAR(255),
    "Kategorija" integer,
    "Išsilavinimas" VARCHAR(255)
);

INSERT INTO Projektai ("Nr", "Pavadinimas", "Svarba", "Pradžia", "Trukmė") VALUES
(1,	'Studentų apskaita',	'Aukšta',	'2015-01-01',	12),
(2,	'Buhalterinė apskaita',	'Vidutinė',	'2005-03-01',	10),
(3,	'WWW svetainė',			'Ypatinga',	'2005-06-01',	2
);


INSERT INTO Vykdymas ("Projektas", "Vykdytojas", "Statusas", "Valandos") VALUES
(1,	1,	'Programuotojas', 30),
(1,	2,	'Dokumentuotojas', 100),
(1,	3,	'Testuotojas', 100),
(1,	4,	'Vadovas', 100),
(2,	1,	'Programuotojas', 300),
(2,	2,	'Analitikas',	250),
(2,	34,	'Vadovas',	100),
(3,	1,	'Programuotojas', 250),
(3,	2,	'Vadovas',	400),
(3,	3,	'Dizaineris',	150
);

INSERT INTO Vykdytojai ("Nr", "Pavardė", "Kvalifikacija", "Kategorija", "Išsilavinimas") VALUES
(1,	'Jonaitis',	'Informatikas'	,2,	'VU'),
(2,	'Petraitis','Statistikas'	,3,	'VU'),
(3,	'Gražulytė','Inžinierius'	,1,	'\N'),
(4,	'Onaitytė',	'Vadybininkas'	,5,	'VDU'),
(5,	'Antanaitis','Informatikas'	,3,	'VU'
);

ALTER TABLE "Projektai"
    ADD CONSTRAINT "Projektai_pkey" PRIMARY KEY ("Nr");

ALTER TABLE "Vykdymas"
ADD CONSTRAINT "Vykdymas_pkey" PRIMARY KEY ("Projektas", "Vykdytojas");

ALTER TABLE "Vykdytojai"
    ADD CONSTRAINT "Vykdytojai_pkey" PRIMARY KEY ("Nr");


