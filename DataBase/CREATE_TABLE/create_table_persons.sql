CREATE TABLE IF NOT EXISTS Persons (
	FirstName varchar(50),
	LastName varchar(50),
	BirthDate date,
	BirthCountry varchar(50),
	Sex char(1),
	FirstLanguage varchar(20),
	Id int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (Id)
)
