ALTER TABLE MachineToPerson ADD FOREIGN KEY (IdMachine) REFERENCES Machines(Id);
ALTER TABLE MachineToPerson ADD FOREIGN KEY (IdPerson) REFERENCES Persons(Id);
ALTER TABLE Events ADD FOREIGN KEY (PersonId) REFERENCES Persons(Id);
ALTER TABLE Events ADD FOREIGN KEY (PlaceId) REFERENCES Places(Id);
ALTER TABLE CrawlingResultsRelation ADD FOREIGN KEY (PlaceId) REFERENCES Places(Id);
ALTER TABLE CrawlingResultsRelation ADD FOREIGN KEY (EventId) REFERENCES Events(Id);
ALTER TABLE CrawlingResultsRelation ADD FOREIGN KEY (PersonId) REFERENCES Persons(Id);
ALTER TABLE CrawlingResultsRelation ADD FOREIGN KEY (MachineId) REFERENCES Machines(Id);
ALTER TABLE CrawlingResultsRelation ADD FOREIGN KEY (CrawlingRecordId) REFERENCES CrawlingRecords(Id);

