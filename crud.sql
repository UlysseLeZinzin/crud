SET NAMES 'utf8';
SET CHARACTER SET utf8;

DROP DATABASE IF EXISTS crud;
CREATE DATABASE crud;
USE crud;

CREATE TABLE personnes (
   id_personne INT PRIMARY KEY AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL UNIQUE,
   tel VARCHAR(50) NOT NULL,
   mdp VARCHAR(50) NOT NULL,
   admin BOOLEAN DEFAULT FALSE,
   etudiant BOOLEAN DEFAULT FALSE,
   prof BOOLEAN DEFAULT FALSE
);

CREATE TABLE cours (
   id_cour INT PRIMARY KEY AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL
);

CREATE TABLE inscription (
   id INT PRIMARY KEY AUTO_INCREMENT,
   id_personne INT,
   id_cour INT,
   FOREIGN KEY (id_personne) REFERENCES personnes(id_personne),
   FOREIGN KEY (id_cour) REFERENCES cours(id_cour)
);

INSERT INTO personnes (nom, prenom, email, tel, mdp, admin, etudiant, prof) VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', '0601020304', 'mdp123', FALSE, TRUE, FALSE),
('Martin', 'Sophie', 'sophie.martin@email.com', '0602030405', 'mdp123', FALSE, TRUE, FALSE),
('Bernard', 'Luc', 'luc.bernard@email.com', '0603040506', 'mdp123', FALSE, FALSE, TRUE),
('Robert', 'Elise', 'elise.robert@email.com', '0604050607', 'mdp123', FALSE, TRUE, FALSE),
('Petit', 'Nicolas', 'nicolas.petit@email.com', '0605060708', 'mdp123', FALSE, TRUE, FALSE),
('Durand', 'Alice', 'alice.durand@email.com', '0606070809', 'mdp123', FALSE, FALSE, TRUE),
('Lemoine', 'Paul', 'paul.lemoine@email.com', '0607080910', 'mdp123', FALSE, TRUE, FALSE),
('Morel', 'Julie', 'julie.morel@email.com', '0608091011', 'mdp123', TRUE, FALSE, FALSE),
('Simon', 'David', 'david.simon@email.com', '0609101112', 'mdp123', FALSE, TRUE, FALSE),
('Laurent', 'Emma', 'emma.laurent@email.com', '0610111213', 'mdp123', FALSE, FALSE, TRUE);

INSERT INTO cours (nom) VALUES
('Mathématiques'),
('Informatique'),
('Histoire'),
('Physique'),
('Anglais');

INSERT INTO inscription (id_personne, id_cour) VALUES
(1, 1), (1, 2), (1, 3), (2, 1), (2, 4), 
(3, 2), (3, 5), (4, 1), (4, 3), (4, 5),
(5, 2), (5, 4), (6, 1), (6, 5), (7, 3), 
(7, 4), (8, 1), (9, 2), (9, 5), (10, 3);
