CREATE TABLE IF NOT EXISTS CrawlingRecords (
	TypeCrawlingRecord varchar(255),
	Priority int,
	PathFile varchar(255),
	LastUpdate date,
	CreationDate date,
	Id int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (Id)
)
