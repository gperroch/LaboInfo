CREATE TABLE IF NOT EXISTS Places (
	Name varchar(255) NOT NULL,
	Coordinates tinyblob,
	Id int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (Id)
);
