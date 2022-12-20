CREATE DATABASE exo_20221220;
USE exo_20221220;

CREATE TABLE utilisateur(
id_util INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
login_util VARCHAR(50) NOT NULL,
mot_pass_util VARCHAR(100) NOT NULL,
id_droit INT
)Engine=InnoDB;

CREATE TABLE droit(
id_droit INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_droit VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE commerciaux(
id_com INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_com VARCHAR(50) NOT NULL,
prenom_com VARCHAR(50) NOT NULL,
tel_com VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE client(
id_client INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_cli VARCHAR(50) NOT NULL,
tel_cli VARCHAR(50) NOT NULL,
adr_num_cli INT,
adr_rue_cli VARCHAR(50),
adr_ville_cli VARCHAR(50),
adr_cp_cli VARCHAR(50),
adr_pays VARCHAR(50)
)Engine=InnoDB;

CREATE TABLE produitfinis(
id_pf INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_pf VARCHAR(50) NOT NULL,
prix_vente_pf FLOAT NOT NULL,
qte_stk FLOAT,
id_type_pf INT
)Engine=InnoDB;

CREATE TABLE matprem(
id_matprem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_mat VARCHAR(50) NOT NULL,
prix_achat FLOAT,
qte_stk FLOAT
)Engine=InnoDB;

CREATE TABLE type_pf(
id_type_pf INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_type_pf VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE fournisseur(
id_fourn INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_fourn VARCHAR(50) NOT NULL,
tel_fourn VARCHAR(50) NOT NULL,
adr_num_fourn INT,
adr_rue_fourn VARCHAR(50),
adr_cp_fourn VARCHAR(50),
adr_ville_fourn VARCHAR(50),
adr_pays_fourn VARCHAR(50)
)Engine=InnoDB;

CREATE TABLE promouvoir(
id_pf INT NOT NULL,
id_com INT NOT NULL
)Engine=innoDB;

CREATE TABLE fideliser(
id_client INT NOT NULL,
id_com INT NOT NULL,
chiffre_affaire FLOAT
)Engine=innoDB;

CREATE TABLE vendre(
id_client INT NOT NULL,
id_pf INT NOT NULL
)Engine=innoDB;

CREATE TABLE fabriquer(
id_matprem INT NOT NULL,
id_pf INT NOT NULL
)Engine=innoDB;

CREATE TABLE acheter(
id_fourn INT NOT NULL,
id_matprem INT NOT NULL
)Engine=innoDB;

ALTER TABLE promouvoir
ADD CONSTRAINT fk_promouvoir_produitfinis
FOREIGN KEY (id_pf)
REFERENCES produitfinis(id_pf);

ALTER TABLE promouvoir
ADD CONSTRAINT fk_promouvoir_commerciaux
FOREIGN KEY (id_com)
REFERENCES commerciaux(id_com);

ALTER TABLE fideliser
ADD CONSTRAINT fk_fideliser_client
FOREIGN KEY (id_client)
REFERENCES client(id_client);

ALTER TABLE fideliser
ADD CONSTRAINT fk_fideliser_commerciaux
FOREIGN KEY (id_com)
REFERENCES commerciaux(id_com);

ALTER TABLE vendre
ADD CONSTRAINT fk_vendre_produitfinis
FOREIGN KEY (id_pf)
REFERENCES produitfinis(id_pf);

ALTER TABLE vendre
ADD CONSTRAINT fk_vendre_client
FOREIGN KEY (id_client)
REFERENCES client(id_client);

ALTER TABLE fabriquer
ADD CONSTRAINT fk_fabriquer_matprem
FOREIGN KEY (id_matprem)
REFERENCES matprem(id_matprem);

ALTER TABLE fabriquer
ADD CONSTRAINT fk_fabriquer_produitfinis
FOREIGN KEY (id_pf)
REFERENCES produitfinis(id_pf);

ALTER TABLE acheter
ADD CONSTRAINT fk_acheter_matprem
FOREIGN KEY (id_matprem)
REFERENCES matprem(id_matprem);

ALTER TABLE acheter
ADD CONSTRAINT fk_acheter_fournisseur
FOREIGN KEY (id_fourn)
REFERENCES fournisseur(id_fourn);

-- ECRIRE LES REQUETES QUI PERMETTRONT DE CREER DES ENREGISTREMENTS DANS CHACUNE DES TABLES :  --
INSERT INTO nomDeLaTable(nomDeLatrribut) VALUES
(nom);

-- DANS LE TABLE CLIENT CREER DEUX CLIENTS QUI ONT LE MEME NOM : --

INSERT INTO client(nom_cli,tel_cli,adr_num_cli,adr_rue_cli,adr_ville_cli,adr_cp_cli,adr_pays) VALUES
('Dupont','0606060606',5,'rue esquaile','Toulouse','31000','France'),('Dupont','0707070707',2,'rue achté-aimaile','Toulouse','31000','France');

-- DANS LE TABLE COMMERCIAUX CREER DES COMMERCIAUX DONT LE NOM COMMENCE PAR A, C, L, M, P : --

INSERT INTO commerciaux(nom_com,prenom_com,tel_com) VALUES
('Absol','nicolas','4569235874'),('Camerupt','michel','5698346827'),('Lainergie','clément','7391562145'),('Mackogneur','franck','5678324591'),('Papilusion','martine','1245129853');

-- DANS LE TABLE PRODUIT CREER DES PRODUITS SANS TYPE : --

INSERT INTO produitfinis(nom_pf,prix_vente_pf,qte_stk) VALUES
('kebab',5.50,250),('cordon-bleu',3.80,156),('croque_monsieur',2.90,412),('big-mac',4.60,325);

-- CREER DEUX FOURNISSEURS QUI VIENNENT D’ARRIVER (L’ENTREPRISE LEUR AURA DONC RIEN ACHETE A CES FOURNISSEURS): --

INSERT INTO fournisseur(nom_fourn,tel_fourn,adr_num_fourn,adr_rue_fourn,adr_cp_fourn,adr_ville_fourn,adr_pays_fourn) VALUES
('Palkia', '01 23 45 67 89', '5', 'Rue des Fleurs', '75000', 'Paris', 'France'),('Smogogo', '98 76 54 32 10', '15', 'Avenue des Arbres', '92100', 'Boulogne-Billancourt', 'France');

-- CREER DEUX NOUVELLES MATIERES PREMIERES (L’ENTREPRISE N’EN A DONC JAMAIS ACHETE): --

INSERT INTO matprem(nom_mat) VALUES
('poulet'),('boeuf');

-- CREER DEUX FOURNISSEURS A QUI NOUS AVONS DEJA ACHETE UNE MATIERE PREMIERE : --

INSERT INTO fournisseur(nom_fourn,tel_fourn,adr_num_fourn,adr_rue_fourn,adr_cp_fourn,adr_ville_fourn,adr_pays_fourn) VALUES
('Tygnon', '01 23 45 58 78', '3', 'Rue des machins', '75000', 'Paris', 'France'),('Kabuto', '98 65 89 32 10', '15', 'Avenue des trucs', '92100', 'Boulogne-Billancourt', 'France');

INSERT INTO acheter(id_fourn,id_matprem) VALUES
(3,1),(4,2);

-- CREER DEUX MATIERES PREMIERES QUI ONT DEJA ETE ACHETEES : --

INSERT INTO matprem(nom_mat) VALUES
('jambon'),('fromage');

INSERT INTO acheter(id_fourn,id_matprem) VALUES
(1,3),(1,4);

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS TYPEPF: --

DELETE FROM type_pf
WHERE id = 'id de lenregistrement à supprimer' ;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS TYPEPF QUI EST UTILISE DANS PRODUIT FINIS : --

DELETE FROM type_pf 
WHERE id IN (SELECT id_type_pf FROM produitfinis WHERE id_type_pf = 'id de l enregistrement de type_pf à supprimer');

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS FIDELISER : --

DELETE FROM fideliser
WHERE id = 'id de lenregistrement à supprimer' ;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE CHANGER LE NOM D’UN CLIENT : --

UPDATE client
SET nom_cli = 'Pyroli'
WHERE id = 'id du client a modifier';

-- ECRIRE UNE REQUETE QUI PERMETTRA DE RAJOUTER 20000 AU CHIFFRE D’AFFAIRE D’UN COMMERCIAL POUR UN CLIENT (VOUS AVEZ LE CHOIX DU CLIENT ET COMMERCIAL) : --



































































































