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
('Dupont', 'Jean', 'jean.dupont@email.com', '$2y$10$GxIJSF40vKkAlP1zvSWJnODIteVYMsusU4cf4qb9CZsKCIoPHei/O', '0601020304', TRUE, FALSE, FALSE),
('Martin', 'Sophie', 'sophie.martin@email.com', '$2y$10$oz64FtI6uorCncYrm2t1n.MsIH1UCn0cC9.MUDalWCvXj7hRR1bBS', '0611223344', FALSE, TRUE, FALSE),
('Durand', 'Paul', 'paul.durand@email.com', '$2y$10$9dAh.LOmUYcffvNlODin5.AXK7kxSu0dnxtxRqCrHC3SC4v7dq46i', '0622334455', FALSE, FALSE, TRUE),
('Lefevre', 'Alice', 'alice.lefevre@email.com', '$2y$10$85gvtoUCIbhrTcvMvf.9nuALLj0m/KM/IrcN9HK9GTQuFdREYaFZy', '0633445566', FALSE, TRUE, FALSE),
('Morel', 'Luc', 'luc.morel@email.com', '$2y$10$OgBUzI8kWlBohx0xYjkFQuZKogpV/VH5Qqz8yZRYDYuxkh5i29dWi', '0644556677', FALSE, TRUE, FALSE),
('Bernard', 'Elise', 'elise.bernard@email.com', '$2y$10$5bLW223r9TyJHCQyKxVdvO4PqEip9S5AN2y05Ya3x403D9jTc33UO', '0655667788', FALSE, FALSE, TRUE),
('Roux', 'Hugo', 'hugo.roux@email.com', '$2y$10$MIVLDYZfXevJ5IWM7bxk5.jU8jtgMeqLu55HbMKTwz6mVmsxb4hdu', '0666778899', FALSE, TRUE, FALSE),
('Vincent', 'Marie', 'marie.vincent@email.com', '$2y$10$YQ8re2bvHfbVi2spZGDJjuRnCbA.19oYeVE93UEb/3DhCEeHgOhaC', '0677889900', FALSE, FALSE, TRUE),
('Fabre', 'Nicolas', 'nicolas.fabre@email.com', '$2y$10$cI8ClLcZm5ahXqxk7jBxgehTm3VI3DlLZPBDYZDtpbTZLHGq/tNq6', '0688990011', FALSE, TRUE, FALSE),
('Giraud', 'Camille', 'camille.giraud@email.com', '$2y$10$wSutd14vufdEjg04zlKuK.BhVU640HKQ6hOMv4IXZC8qWDbmsw65S', '0699001122', FALSE, TRUE, FALSE);

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