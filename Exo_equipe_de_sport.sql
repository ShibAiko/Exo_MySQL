CREATE DATABASE sport;
USE sport;

CREATE TABLE joueur(
id_joueur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_joueur VARCHAR(50),
prenom_joueur VARCHAR(50),
age_joueur VARCHAR(50),
id_poste INT,
id_equipe INT
)Engine=InnoDB;

CREATE TABLE poste(
id_poste INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_poste VARCHAR(50)
)Engine=InnoDB;

CREATE TABLE equipe(
id_equipe INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_equipe VARCHAR(50)
)Engine=InnoDB;

CREATE TABLE sport_match(
id_sport_match INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
date_match DATETIME,
id_competition INT,
id_stade INT,
id_phase INT
)Engine=InnoDB;

CREATE TABLE phase(
id_phase INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_phase VARCHAR(50)
)Engine=InnoDB;

CREATE TABLE competition(
id_competition INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_competition VARCHAR(50),
date_competition DATE
)Engine=InnoDB;

CREATE TABLE stade(
id_stade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_stade VARCHAR(50),
nom_rue_stade VARCHAR(50),
num_rue_stade INT,
cp_stade INT,
ville_stade VARCHAR(50)
)Engine=InnoDB;

CREATE TABLE participer(
id_equipe1 INT NOT NULL,
id_sport_match INT NOT NULL,
id_equipe2 INT NOT NULL,
score_equipe1 INT NOT NULL,
score_equipe2 INT NOT NULL
)Engine=InnoDB;

ALTER TABLE joueur
ADD CONSTRAINT fk_integrer_equipe
FOREIGN KEY (id_equipe)
REFERENCES equipe(id_equipe);

ALTER TABLE joueur
ADD CONSTRAINT fk_qualifier_poste
FOREIGN KEY (id_poste)
REFERENCES poste(id_poste);

ALTER TABLE sport_match
ADD CONSTRAINT fk_completer_phase
FOREIGN KEY (id_phase)
REFERENCES phase(id_phase);

ALTER TABLE sport_match
ADD CONSTRAINT fk_localiser_stade
FOREIGN KEY (id_stade)
REFERENCES stade(id_stade);

ALTER TABLE sport_match
ADD CONSTRAINT fk_contenir_competition
FOREIGN KEY (id_competition)
REFERENCES competition(id_competition);

ALTER TABLE participer
ADD CONSTRAINT fk_participer_sport_match
FOREIGN KEY (id_sport_match)
REFERENCES sport_match(id_sport_match);

ALTER TABLE participer
ADD CONSTRAINT fk_participer_equipe1
FOREIGN KEY (id_equipe1)
REFERENCES equipe(id_equipe);

ALTER TABLE participer
ADD CONSTRAINT fk_participer_equipe2
FOREIGN KEY (id_equipe2)
REFERENCES equipe(id_equipe);

-- Ajouter  dans la base ci-dessus des enregistrements dans toutes les tables (minimum 3 enregistrements par table) --

INSERT INTO equipe (nom_equipe)
VALUES ('Paris Saint-Germain'), ('Olympique de Marseille'), ('AS Monaco');

INSERT INTO poste (nom_poste)
VALUES ('Attaquant'), ('Défenseur'), ('Gardien de but');

INSERT INTO phase (nom_phase)
VALUES ('Groupe A'), ('Groupe B'), ('Quarts de finale');

INSERT INTO stade (nom_stade, nom_rue_stade, num_rue_stade, cp_stade, ville_stade)
VALUES ('Parc des Princes', 'Avenue du Général-Saumier', 32, 75000, 'Paris'), 
       ('Stade Vélodrome', 'Boulevard Michelet', 15, 13000, 'Marseille'), 
       ('Stade Louis II', 'Avenue des Castelans', 1, 98000, 'Monaco');

INSERT INTO joueur (nom_joueur, prenom_joueur, age_joueur, id_poste, id_equipe)
VALUES ('Doe', 'John', '25', 1, 1), ('Smith', 'Jane', '30', 2, 2), ('Brown', 'Bill', '28', 3, 3);

INSERT INTO competition (nom_competition, date_competition)
VALUES ('Champions League', '2022-06-01'),('World Cup', '2022-12-18'),('Tournoi', '2022-10-18');

INSERT INTO sport_match (date_match, id_competition, id_stade, id_phase)
VALUES ('2022-01-01 12:00:00', 1, 1, 1), ('2022-02-01 12:00:00', 2, 2, 2), ('2022-03-01 12:00:00', 3, 3, 3);

INSERT INTO participer (id_equipe1, id_sport_match, id_equipe2, score_equipe1, score_equipe2)
VALUES (1, 1, 2, 3, 0), (2, 2, 3, 2, 1), (3, 3, 1, 1, 2);





