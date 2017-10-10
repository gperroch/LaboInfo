create database if not exists informations_gatherer;
use informations_gatherer;
create table if not exists persons (idPerson int NOT NULL PRIMARY KEY AUTO_INCREMENT, first_name varchar(30), last_name varchar(30));
create table if not exists places (idPlace int NOT NULL PRIMARY KEY AUTO_INCREMENT, name varchar(30), description text);
create table if not exists locations (idLocation int NOT NULL PRIMARY KEY AUTO_INCREMENT, idPlace int NOT NULL, idPerson int NOT NULL, date_start date, date_end date, FOREIGN KEY (idPlace) REFERENCES places(idPlace), FOREIGN KEY (idPerson) REFERENCES persons(idPerson));
create table if not exists relationships (idRelationship int NOT NULL PRIMARY KEY AUTO_INCREMENT, idPersonOne int NOT NULL, idPersonTwo int NOT NULL, levelRelationship int, description text, FOREIGN KEY (idPersonOne) REFERENCES persons(idPerson), FOREIGN KEY (idPersonTwo) REFERENCES persons(idPerson));
