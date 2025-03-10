SET NAMES 'utf8';
SET CHARACTER SET utf8;

-- Création de la base de données
DROP DATABASE IF EXISTS `crud`;
CREATE DATABASE `crud`; 
USE `crud`;

-- Création des tables
CREATE TABLE personnes(
   id INT PRIMARY KEY AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   mot_de_passe VARCHAR(120),
   telephone VARCHAR(50),
   admin BOOLEAN,
   etudiant BOOLEAN,
   professeur BOOLEAN
);

CREATE TABLE cours(
   id INT PRIMARY KEY AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL
);

CREATE TABLE inscriptions(
   id INT PRIMARY KEY AUTO_INCREMENT,
   id_personne INT,
   id_cours INT,
   FOREIGN KEY(id_personne) REFERENCES personnes(id),
   FOREIGN KEY(id_cours) REFERENCES cours(id)
);

-- Remplissage des tables
-- Insérer des données dans la table personnes
INSERT INTO personnes (nom, prenom, email, mot_de_passe, telephone, admin, etudiant, professeur) VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', 'mdp123', '0601020304', TRUE, FALSE, FALSE),
('Martin', 'Sophie', 'sophie.martin@email.com', 'mdp456', '0611223344', FALSE, TRUE, FALSE),
('Durand', 'Paul', 'paul.durand@email.com', 'mdp789', '0622334455', FALSE, FALSE, TRUE),
('Lefevre', 'Alice', 'alice.lefevre@email.com', 'mdp234', '0633445566', FALSE, TRUE, FALSE),
('Morel', 'Luc', 'luc.morel@email.com', 'mdp345', '0644556677', FALSE, TRUE, FALSE),
('Bernard', 'Elise', 'elise.bernard@email.com', 'mdp567', '0655667788', FALSE, FALSE, TRUE),
('Roux', 'Hugo', 'hugo.roux@email.com', 'mdp678', '0666778899', FALSE, TRUE, FALSE),
('Vincent', 'Marie', 'marie.vincent@email.com', 'mdp789', '0677889900', FALSE, FALSE, TRUE),
('Fabre', 'Nicolas', 'nicolas.fabre@email.com', 'mdp890', '0688990011', FALSE, TRUE, FALSE),
('Giraud', 'Camille', 'camille.giraud@email.com', 'mdp901', '0699001122', FALSE, TRUE, FALSE);

-- Insérer des données dans la table cours
INSERT INTO cours (nom) VALUES
('Mathematiques'),
('Physique'),
('Informatique'),
('Chimie'),
('Histoire');

-- Insérer des données dans la table inscriptions
INSERT INTO inscriptions (id_personne, id_cours) VALUES
(2, 1), (2, 2), (3, 3), (4, 1), (4, 4),
(5, 2), (5, 5), (6, 3), (6, 1), (7, 2),
(7, 3), (8, 4), (8, 5), (9, 1), (9, 2),
(9, 3), (10, 4), (10, 5), (3, 5), (6, 2);