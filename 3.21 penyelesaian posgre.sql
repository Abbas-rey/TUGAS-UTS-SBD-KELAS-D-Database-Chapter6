CREATE TABLE Bill (
    Bill_name VARCHAR(100) NOT NULL,
    Date_of_vote DATE,
    Passed_or_failed VARCHAR(3),
    PRIMARY KEY (Bill_name)
);

CREATE TABLE CongressPerson (
    Name VARCHAR(100) NOT NULL,
    District VARCHAR(50),
    Start_date DATE,
    Party VARCHAR(20),
    State_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Name)
);

CREATE TABLE Relation_2 (
    CongressPerson_Name VARCHAR(100) NOT NULL,
    Bill_Bill_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (CongressPerson_Name, Bill_Bill_name)
);

CREATE TABLE State (
    Name VARCHAR(50) NOT NULL,
    Region VARCHAR(50),
    PRIMARY KEY (Name)
);

CREATE TABLE VoteRecord (
    VoteStatus VARCHAR(10),
    Bill_Bill_name VARCHAR(100) NOT NULL,
    CongressPerson_Name VARCHAR(100) NOT NULL
);

ALTER TABLE CongressPerson ADD CONSTRAINT CongressPerson_State_FK FOREIGN KEY (State_Name) REFERENCES State(Name);

ALTER TABLE Relation_2 ADD CONSTRAINT Relation_2_Bill_FK FOREIGN KEY (Bill_Bill_name) REFERENCES Bill(Bill_name);

ALTER TABLE Relation_2 ADD CONSTRAINT Relation_2_CongressPerson_FK FOREIGN KEY (CongressPerson_Name) REFERENCES CongressPerson(Name);

ALTER TABLE VoteRecord ADD CONSTRAINT VoteRecord_Bill_FK FOREIGN KEY (Bill_Bill_name) REFERENCES Bill(Bill_name);

ALTER TABLE VoteRecord ADD CONSTRAINT VoteRecord_CongressPerson_FK FOREIGN KEY (CongressPerson_Name) REFERENCES CongressPerson(Name);