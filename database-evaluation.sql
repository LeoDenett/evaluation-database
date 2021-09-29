CREATE DATABASE IF NOT EXISTS  evaluation_database;

CREATE TABLE IF NOT EXISTS Admin_cinema (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lastname varchar(50) NOT NULL,
    firstname varchar(60) NOT NULL,
    mail varchar(255) NOT NULL
);

CREATE TABLE  IF NOT EXISTS Cinema (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL,
    adress varchar(60) NOT NULL,
    city varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Seance (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    salle int(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Film (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL,
    genre varchar(50) NOT NULL,
    time varchar(260) NOT NULL
);

CREATE TABLE IF NOT EXISTS Paiement(
    id int(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    type_paiment varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Client (
    id int(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    firstname varchar(50) NOT NULL,
    lastname varchar(50) NOT NULL,
    age int(2) NOT NULL,
    tel int(10) NOT NULL,
    mail varchar(255) NOT NULL,
    password varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Tarif(
    id int(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    price decimal(60) NOT NULL
);

ALTER TABLE Tarif ADD category varchar(260) NOT NULL;

CREATE TABLE  IF NOT EXISTS Reservation (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    start_movie DATETIME NOT NULL,
    id_film int(11) NOT NULL,
    CONSTRAINT fk_id_film
    FOREIGN KEY (id_film) REFERENCES Film(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    id_paiement int(11) NOT NULL,
    CONSTRAINT fk_id_paiement
    FOREIGN KEY (id_paiement) REFERENCES Paiement(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    id_client int(11) NOT NULL,
    CONSTRAINT fk_id_client
    FOREIGN KEY(id_client) REFERENCES Client(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    id_seance int(11) NOT NULL,
    CONSTRAINT fk_id_seance
    FOREIGN KEY(id_seance) REFERENCES Seance(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    id_tarif int(11) NOT NULL,
    CONSTRAINT fk_id_tarif
    FOREIGN KEY(id_tarif) REFERENCES Tarif(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

INSERT INTO Admin_cinema (lastname, firstname, mail) VALUES ('Denett', 'Leonel', 'evaluationtest@test.com' );

INSERT INTO Cinema (name, adress, city) VALUES ('Cinemania', 'Av. TodoBoke', 'Landivisiau');

INSERT INTO Client (firstname, lastname, age, tel, mail, password) VALUES ('Rapha', 'Poti', 24, 0101010101, 'raphi@raphi.com', MD5('chupapig')), ('Andrea', 'Potis', 20, 2020202020, 'andrea@andrea.com', MD5('mugli')), ('Gabi', 'Denis', 21, 2020202022, 'gabi@gabi.com', MD5('river'));

INSERT INTO Film (name, genre, time) VALUES ('Narnia', 'Fantasy', '2h30min'), ('Terminator', 'Action', '2h10min');

INSERT INTO Paiement (id, type_paiment) VALUES (null, 'Cinema'), (null, 'En ligne');

INSERT INTO Tarif (id, price, category) VALUES (null, 8, 'Adult'), (null, 6, 'Etudiant'), (null, 4.50, 'Enfant(12 ans)');

INSERT INTO Seance (id, salle) VALUES (null, 1), (null, 2);

INSERT INTO Reservation (id, start_movie, id_film, id_paiement, id_client, id_seance, id_tarif) VALUES (null, '2021-09-28 20:16', 1, 1, 1, 2, 3 ), (null, '2021/09/29 17:30', 2, 2, 2, 1, 1 );

