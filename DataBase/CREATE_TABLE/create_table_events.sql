CREATE TABLE IF NOT EXISTS Events (
	Name varchar(255),
	PersonId int,
	PlaceId int,
	DateEvent date,
	SubId int,
	Id int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (Id)
)
